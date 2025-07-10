
import pyshark
import pandas as pd
import seaborn as sns
import matplotlib.pyplot as plt
import matplotlib.dates as mdates
from scipy.stats import entropy

from scapy.all import *
from collections import defaultdict
from collections import Counter
import pyshark

# Carregamento e filtragem TCP

print("Carregando pacotes...")
#packets = rdpcap('t90k.pcap')
packets = rdpcap('202204130415.pcap')
print("Pacotes carregados.")
print("Filtrando TCP...")
tcp_packets = [pkt for pkt in packets if TCP in pkt]
print("TCP filtrados.")

# Agrupamento por conexão

conns = defaultdict(list)
for pkt in tcp_packets:
    if IP in pkt and TCP in pkt:
        key = tuple(sorted([(pkt[IP].src, pkt[TCP].sport), (pkt[IP].dst, pkt[TCP].dport)]))
        conns[key].append(pkt)

# === RESULTADOS ===
resultados = []

for conn_key, pkts in conns.items():
    pkts = sorted(pkts, key=lambda x: x.time)
    start_time = pkts[0].time
    end_time = pkts[-1].time
    duracao = end_time - start_time

    # Bytes totais transferidos
    total_bytes = sum(len(p) for p in pkts if Raw in p)

    # RTT (estimado com 1º pacote e primeiro ACK com ACK flag)
    syn_pkt = next((p for p in pkts if p[TCP].flags == "S"), None)
    synack_pkt = next((p for p in pkts if p[TCP].flags == "SA"), None)
    ack_pkt = next((p for p in pkts if p[TCP].flags == "A"), None)
    handshake_time = (ack_pkt.time - syn_pkt.time) if syn_pkt and ack_pkt else None

    # RTT estimado simples
    rtts = []
    sent_times = {}
    for p in pkts:
        if p[TCP].flags & 0x10 == 0:  # não ACK puro
            sent_times[p[TCP].seq] = p.time
        elif p[TCP].flags & 0x10:  # ACK
            ack = p[TCP].ack
            if ack in sent_times:
                rtts.append(p.time - sent_times[ack])
    rtt_medio = sum(rtts)/len(rtts) if rtts else None

    # Retransmissões (SEQ repetido)
    seqs = set()
    retransmissoes = 0
    for p in pkts:
        seq = p[TCP].seq
        if seq in seqs:
            retransmissoes += 1
        else:
            seqs.add(seq)

    # Throughput
    throughput = total_bytes / duracao if duracao > 0 else 0

    # Tamanhos dos segmentos TCP
    tamanhos = [len(p[TCP].payload) for p in pkts if Raw in p]

    # MSS (Maximum Segment Size) - das opções TCP
    mss = None
    for p in pkts:
        if p[TCP].options:
            for opt in p[TCP].options:
                if opt[0] == 'MSS':
                    mss = opt[1]
                    break
        if mss:
            break

    # Microbursts (mais de X pacotes em <Y ms)
    times = [p.time for p in pkts]
    microbursts = 0
    for i in range(1, len(times)):
        if times[i] - times[i-1] < 0.001:  # 1ms
            microbursts += 1

    # Fluxos elefantes: > 100 MB
    elefante = total_bytes > 100 * 1024 * 1024

    resultados.append({
        'conexao': conn_key,
        'duracao': duracao,
        'rtt_medio': rtt_medio,
        'retransmissoes': retransmissoes,
        'throughput': throughput,
        'handshake_time': handshake_time,
        'mss': mss,
        'total_bytes': total_bytes,
        'microbursts': microbursts,
        'elefante': elefante
    })

# === EXPORTAR PARA CSV / PRINTAR ===
df = pd.DataFrame(resultados)
print(df)
df.to_csv("metricas_tcp.csv", index=False)

# Top aplicações acessadas

dst_ports = [pkt[TCP].dport for pkt in tcp_packets if pkt.haslayer(TCP)]
top_ports = Counter(dst_ports).most_common(10)
print("Top 10 portas mais acessadas:")
for port, count in top_ports:
    print(f"Porta {port} - {count} conexões")
