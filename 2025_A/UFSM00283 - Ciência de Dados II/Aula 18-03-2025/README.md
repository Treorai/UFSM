# 18/03/2025

## KDD

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
