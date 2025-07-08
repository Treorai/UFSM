
import pyshark
import pandas as pd
import seaborn as sns
import matplotlib.pyplot as plt
import matplotlib.dates as mdates
from scipy.stats import entropy

capture = pyshark.FileCapture('teste_500.pcap', display_filter='ip')
#capture = pyshark.FileCapture('202204130415.pcap', display_filter='ip')

# Pré processamento do pcap

## Transformar cada pacote em linha de um dataframe cotendo timestamp, ip de origem e destino, tamanho do pacote, e ipg:
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

# Métricas Obrigatórias

## Top 10 IPs em pacotes enviados
top_ips = df['src_ip'].value_counts().head(10)
print("\nTop 10 IPs mais ativos:")
print(top_ips)

## IPG médio
ipg_medio = df['timestamp'].diff().mean()
print("\nIPG médio:")
print(ipg_medio)

## IPG Desvio Padrão
ipg_std = df['timestamp'].diff().std()
print("\nDesvio padrão do IPG:")
print(ipg_std)

## Entropia da distribuição de IPs de origem

p = df['src_ip'].value_counts(normalize=True)
ip_entropy = entropy(p)
print("\nEntropia da distribuição de IPs de origem:")
print(ip_entropy)

## Volume total de bytes transmitidos no pcap
total_bytes = df['length'].sum()
print("\nVolume total de bytes transmitidos no pcap:")
print(total_bytes)

## Volume total de bytes transmitidos por IP
bytes_por_ip = df.groupby('src_ip')['length'].sum()
print("\nVolume total de bytes transmitidos por IP:")
print(bytes_por_ip)

## Volume total de trafego a cada 5 segundos
df['datetime'] = pd.to_datetime(df['timestamp'], unit='s')
temporal_count = df.groupby(pd.Grouper(key='datetime', freq='1s')).size()
temporal_bytes = df.groupby(pd.Grouper(key='datetime', freq='1s'))['length'].sum()

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

plt.figure(figsize=(12, 5))
plt.plot(temporal_bytes.index, temporal_bytes.values, marker='o', linestyle='-')

plt.title("Tráfego agregado (em bytes) ao longo do tempo")
plt.xlabel("Tempo")
plt.ylabel("Total de bytes por janela de 5s")

plt.tight_layout()
plt.savefig("trafego_5s_bytes.png")  # Salva a imagem
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