
import pyshark
import numpy as np
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

# RESULTADOS
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

    # Fluxos elefantes: ( > 100 MB)
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

# EXPORTAR PARA CSV
df = pd.DataFrame(resultados)
print(df)
df.to_csv("metricas_tcp.csv", index=False)

# Top aplicações acessadas
dst_ports = [pkt[TCP].dport for pkt in tcp_packets if pkt.haslayer(TCP)]
top_ports = Counter(dst_ports).most_common(10)
print("Top 10 portas mais acessadas:")
for port, count in top_ports:
    print(f"Porta {port} - {count} conexões")

# GRÁFICOS SUGERIDOS
print("Plotando Gráficos.")
# Gráfico da curva da janela de congestionamento ao longo do tempo

## (Adicionar coleta da janela de congestionamento por tempo)
janela_cong = []
for p in tcp_packets:
    if TCP in p and p[TCP].window:
        janela_cong.append({'tempo': p.time, 'window_size': p[TCP].window})

df_janela = pd.DataFrame(janela_cong)

# Conversão segura do tempo
df_janela['tempo'] = df_janela['tempo'].astype(float)
df_janela['tempo'] = pd.to_datetime(df_janela['tempo'], unit='s')

# Gráfico
plt.figure(figsize=(12, 5))
plt.plot(df_janela['tempo'], df_janela['window_size'], lw=0.8)
plt.title("Evolução da Janela de Congestionamento TCP ao longo do Tempo")
plt.xlabel("Tempo")
plt.ylabel("Window Size")
plt.tight_layout()
plt.savefig("janela_congestionamento.png")
plt.show()


# Gráfico de dispersão do RTT por conexão
plt.figure(figsize=(10, 5))
plt.scatter(range(len(df)), df['rtt_medio'])
plt.title("RTT médio por conexão")
plt.xlabel("Índice da conexão")
plt.ylabel("RTT médio (s)")
plt.grid(True)
plt.tight_layout()
plt.savefig("rtt_por_conexao.png")
plt.show()

# CDF do tempo de handshake
handshakes = df['handshake_time'].dropna().sort_values()
cdf = np.arange(len(handshakes)) / float(len(handshakes))

plt.figure(figsize=(8, 4))
plt.plot(handshakes, cdf, marker='.')
plt.title("CDF do tempo de handshake (3-way)")
plt.xlabel("Tempo de handshake (s)")
plt.ylabel("CDF")
plt.grid(True)
plt.tight_layout()
plt.savefig("cdf_handshake.png")
plt.show()

# Histograma da taxa de retransmissões
plt.figure(figsize=(8, 4))
plt.hist(df['retransmissoes'], bins=30, edgecolor='black')
plt.title("Histograma das retransmissões por conexão")
plt.xlabel("Número de retransmissões")
plt.ylabel("Frequência")
plt.tight_layout()
plt.savefig("hist_retransmissoes.png")
plt.show()

# Comparação entre conexões curtas e longas
df['tipo_conexao'] = df['duracao'].apply(lambda x: 'Curta' if x < 1 else 'Longa')
plt.figure(figsize=(8, 5))
sns.boxplot(x='tipo_conexao', y='throughput', data=df)
plt.title("Comparação do Throughput entre Conexões Curtas e Longas")
plt.ylabel("Throughput (bytes/s)")
plt.xlabel("Tipo de conexão")
plt.tight_layout()
plt.savefig("comparacao_conexoes.png")
plt.show()
