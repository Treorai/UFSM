# Ciência de Dados II

Prof. Gabriel Machado Lunardi  
[gabriel.lunardi@ufsm.br](mailto:gabriel.lunardi@ufsm.br)  

## 18/03/2025

### KDD

| Pré-processamento/Seleção | Pré-processamento/Seleção | Pré-processamento/Seleção | Processamento | Interpretação |
| :- | :- | :- | :- | :- |
| Seleção | Limpeza | Transformação | Mineração | Interpretação |
| Os dados são selecionados a partir de uma ou mais fontes <br> Independe da estrutura | Garantir a qualidade dos dados <br> Padronizar, eliminar duplicatas, tratamento de valores ausentes | Transformar valores simbólicos para numéricos <br> Discretização de atributos <br> Criação de novos atributos | Selecionar tarefas <br> Associação, Classificação, Agrupamento, Predição <br> Escolha e aplicação do algoritmo para construir o modelo | Visualização em gráfico, mapa, etc <br>  |

### Tipos de Mineração

| Associação | Classificação | Agrupamento | Predição |
| :- | :- | :- | :- |
| Procura eventos ou atributos esspecíficos **correlacionados** com outro evento ou atributo | Classifica as observações de forma automática em diferentes categorias | Envole a separação de dados com base nas semelhanças entre os conjuntos de dados | Projetar dados que erão vistos no futuro por meio de modelagem preditiva |
| "Quem compra *x*, tende a comprar *y*." | Banco classificar cliente conforme risco de crédito <br> Email é spam ou não | Separação do público alvo de uma empresa <br> Identificar grupos por padrões | Prever a venda a um cliente baseado nas compras anteriores |

### Produção de plano do projeto de análise de dados

- Objetivo
- Tipo de problema

### Ferramentas

- Apoiam o processo de KDD
- Ferramentas visuais
  - Weka
  - Rapid Miner
  - Orange data mining (DM)
- Ferramentas não visuais
  - Linguagem R
  - Python para análise de dados

### Atributos

- Atributo Discreto
  - Número finito de valores
  - e.g: CEP, CPF
  - Frequentemente uma variável inteira
- Atributo Contínuo
  - Número real
  - e.g: Temperatura
- Estruturados
  - Banco de dados relacional, planilhas
- Semi estruturados
  - Arquivo JSON
- Não etruturados
  - Texto livre (Nesta categoria o KDD é chamado KDT)
  - Imagem, audio, video

### Bibliotecas Python

- Pandas
- Numpy
- Scikit-learn
- Seaborn
- **Jupyter Notebook**
- Spyder IDE

## 20/03/2025

### Análise Exploratória de Dados (EDA)

- Entender os dados  
- Identificar padrões e relações  
- Detectar anomalias  
- Preparar os dados  

| EDA Uni variada | Usa uma única variável para entender distribuição e características |
| :- | :- |
| EDA Bivariada | " Duas " " " |
| EDA Multi variada | " Várias " " "|

### Recursos estatísticos

- Distribuição de frequência
  - Histogramas (variaveis contínuas)
  - Gráficos de barras (variáveis categóricas)
- Medidas de Tendência Central
  - Media
  - Mediana
  - Moda
- Medidas de Dispersão
  - Variancia
  - Desvio padrão
  - Amplitude
- Identificação de Outliers
  - Boxplots
  - Z-scores

Box-plot:

![box-plot-img](https://miro.medium.com/v2/resize:fit:8000/1*0MPDTLn8KoLApoFvI0P2vQ.png)

> Anexo: [Colab: 20032025](20032025_colab.md)

## 25/03/2025

### Transformação de dados

Algumas fontes vem com dados numéricos ou não-numéricos e é importante saber transformar/converter

#### Amostragem

- Amostragem Simples
  - Seleção aleatória sem viés
  - Sem garantia de balanceamento
  - Usamos quando os dados são naturalmente balanceados   
  - Ruim para treinamento de IA
- Amostragem Estratificada
  - Divisão em subgrupos
  - Mantem a proporção
  - Bom para treinamento de IA

#### Normalização

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

