# Pré processamento do pcap

import pyshark

# 500 entradas do pcap para teste
capture = pyshark.FileCapture('teste_500.pcap', display_filter='ip')

# PCAP completo
#capture = pyshark.FileCapture('202204130415.pcap', display_filter='ip')

# Transformar cada pacote em linha de um dataframe cotendo timestamp, ip de origem e destino, tamanho do pacote, e ipg:

import pandas as pd

data = []
for packet in capture:
    try:
        data.append({
            'timestamp': float(packet.sniff_timestamp),
            'src_ip': packet.ip.src,
            'dst_ip': packet.ip.dst,
            'length': int(packet.length)
        })
    except AttributeError:
        continue

df = pd.DataFrame(data)
df.sort_values(by='timestamp', inplace=True)
df['ipg'] = df['timestamp'].diff()
df.dropna(subset=['ipg'], inplace=True)

# Métricas Obrigatórias

## Top 10 IPs em pacotes enviados
top_ips = df['src_ip'].value_counts().head(10)
print("\nTop 10 IPs mais ativos:")
print(top_ips)

## IPG médio
ipg_mean = df['timestamp'].diff().mean()
print("\nIPG médio:")
print(ipg_mean)

## IPG Desvio Padrão
ipg_std = df['timestamp'].diff().std()
print("\nDesvio padrão do IPG:")
print(ipg_std)

## Entropia da distribuição de IPs de origem
from scipy.stats import entropy

p = df['src_ip'].value_counts(normalize=True)
ip_entropy = entropy(p)
print("\nEntropia da distribuição de IPs de origem:")
print(ip_entropy)

## Volume total de bytes transmitidos por IP
bytes_por_ip = df.groupby('src_ip')['length'].sum()
print("\nVolume total de bytes transmitidos por top IP:")
print(bytes_por_ip)

## Variação do Tráfego ao longo do tempo em janelas de 5s
df['datetime'] = pd.to_datetime(df['timestamp'], unit='s')
df['time_bin'] = df['datetime'].dt.floor('5S')  # arredonda para janelas de 5 segundos reais

temporal_count = df.groupby(['time_bin', 'src_ip']).size().unstack(fill_value=0)
temporal_bytes = df.groupby('time_bin')['length'].sum()
print("\nDistribuição do tráfego ao longo do tempo:")
print(temporal_count)
print(temporal_bytes)

## Skewness
skewness = df['length'].skew()
print("\nSkewness do tamanho dos pacotes:")
print(skewness)

## Kurtosis
kurtosis = df['length'].kurtosis()
print("\nKurtosis do tamanho dos pacotes:")
print(kurtosis)

# Gráficos Obrigatórios
import seaborn as sns
import matplotlib.pyplot as plt

## Heatmap dos ips mais ativos (tempo x volume de pacotes x ip)

top_ips_graph = df['src_ip'].value_counts().head(20).index
df_filtered = df[df['src_ip'].isin(top_ips_graph)]
temporal_count = df_filtered.groupby(['time_bin', 'src_ip']).size().unstack(fill_value=0)

plt.figure(figsize=(14, 6))
sns.heatmap(temporal_count.T, cmap='YlOrRd', linewidths=0.5, linecolor='gray')
plt.title('Heatmap dos IPs mais ativos\n(tempo real × IP × volume de pacotes)')
plt.xlabel('Tempo (janela de 5s)')
plt.ylabel('IP de origem')
plt.xticks(rotation=45)
plt.tight_layout()
plt.savefig('heatmap_ips_mais_ativos.png')
plt.show()
plt.close()

## Boxplot do IPG por IP
sns.boxplot(data=df[df['src_ip'].isin(top_ips.index)], x='src_ip', y='ipg')
plt.xticks(rotation=45)
plt.title("Distribuição de IPG por IP de origem")
plt.savefig('ipg_por_ip.png')
plt.show()
plt.close()

## Boxplot do trafego agregado ao longo do tempo
import matplotlib.dates as mdates

print("\n(debug): Bytes agregados por tempo:")
print(temporal_bytes.head())

plt.figure(figsize=(12, 5))
plt.plot(temporal_bytes.index, temporal_bytes.values, marker='o', linestyle='-')
plt.title("Tráfego agregado (em bytes) ao longo do tempo")
plt.xlabel("Tempo")
plt.ylabel("Bytes")
plt.xticks(rotation=45)

# Formatação do eixo X com datas
plt.gca().xaxis.set_major_formatter(mdates.DateFormatter('%H:%M:%S'))
plt.gca().xaxis.set_major_locator(mdates.AutoDateLocator())

plt.tight_layout()
plt.savefig("trafego_ao_longo_do_tempo.png")
plt.show()
plt.close()



## Histograma dos ips
top_ips.plot(kind='bar')
plt.title("Top 10 IPs mais ativos (em pacotes)")
plt.xlabel("IP")
plt.ylabel("Pacotes Enviados")
plt.xticks(rotation=45)
plt.savefig('ips_ativos.png')
plt.show()
plt.close()

# Detecção de Anomalias

unique_dests = df.groupby('src_ip')['dst_ip'].nunique()
suspicious_ips = unique_dests[unique_dests > (unique_dests.mean() + 2 * unique_dests.std())]
print("\nIPs suspeitos:")
print(suspicious_ips)