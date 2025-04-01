# 25/03/2025

## Transformação de dados

Algumas fontes vem com dados numéricos ou não-numéricos e é importante saber transformar/converter

### Amostragem

- Amostragem Simples
  - Seleção aleatória sem viés
  - Sem garantia de balanceamento
  - Usamos quando os dados são naturalmente balanceados   
  - Ruim para treinamento de IA
- Amostragem Estratificada
  - Divisão em subgrupos
  - Mantem a proporção
  - Bom para treinamento de IA

### Normalização

- Uniformizar os dados
- Amplitude
  - Reescala min-max
  - Padronização z-score

| | min-max (reescala) | Z-Score (padronização) |
| :- | :- | :- |
| Intervalo | [0,1] ou [-1, 1] | Sem limites fixos |
| Média | Não necessariamente 0 | Sempre 0 |
| Desvio Padrão | Varia | Sempre 1 |
| Efeito em outliers | Sensível | Robusto |
