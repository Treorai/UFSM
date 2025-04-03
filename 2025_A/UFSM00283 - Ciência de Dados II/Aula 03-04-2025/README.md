# 03/04/2025

## Regressão Linear

Prever um valor numérico contínuo  

Em termos algébricos, $y=mx+b$


$y' = b+w_1x_1$

$y'$ ou $\hat{y}$ : rótulo previsto, ou seja, a saída  
$b$ : bias do modelo  
$w_1$ : peso  
$x_1$ : feature value  

### Exemplo

# **Dataset Preços de casas de Boston**

| Atributo       | Tipo          | Descrição                                                                |
|----------------|---------------|--------------------------------------------------------------------------|
| **MedInc**     | `float`       | Renda média dos residentes (em dezenas de milhares de USD).              |
| **HouseAge**   | `float`       | Idade média das casas (em anos).                                         |
| **AveRooms**   | `float`       | Média de cômodos (quartos + outros) por residência.                      |
| **AveBedrms**  | `float`       | Média de quartos por residência.                                         |
| **Population** | `float`       | População total na área.                                                 |
| **AveOccup**   | `float`       | Média de ocupantes por residência.                                       |
| **Latitude**   | `float`       | Coordenada geográfica (latitude).                                        |
| **Longitude**  | `float`       | Coordenada geográfica (longitude).                                       |
| **MedHouseVal** (Target) | `float` | Valor mediano das casas (em centenas de milhares de USD).            |


$y' = b + w_1x_1 + w_2x2 + w_3x3 + ... + w_nx_n$
