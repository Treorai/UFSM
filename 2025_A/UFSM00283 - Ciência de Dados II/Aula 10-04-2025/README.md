# 10/04/2025

Exploraremos as principais métricas de avaliação para modelos de aprendizado supervisionado. Para modelos de regressão, discutiremos métricas que avaliam a precisão das previsões numéricas:  
- Erro Quadrático Médio (MSE)
- Raiz do Erro Quadrático Médio (RMSE)
- Coeficiente de Determinação (R²)

Já para classificação (regressão logística), abordaremos tópicos que avaliam a capacidade do modelo em discriminar entre classes:  
- Acurácia
- Precisão
- Recall
- F1-Score
- Curva ROC-AUC

O objetivo é entender como escolher e interpretar essas métricas de acordo com o problema e o contexto dos dados.

> Recomendação de Leitura: Capítulo 15 do livro "Inteligência Artificial: Uma abordagem de aprendizado de máquina" 

## Métricas de Avaliação

### Erro

$$ erro = \frac{1}{n} \sum_{i=1}^{n} (x_i \neq y_i)$$

$acc = 1 - erro$  

#### Matriz de confusão:

|| Classe + | Classe - |
|:-|:-:|:-:|
| Classe + | Verdadeiros Positivos | Falsos Negativos |
| Classe - | Ferdadeiros Positivos | Verdadeiros Negativos |

$TFN = \frac{FN}{VP+FN}$  
$TFP = \frac{FP}{FP+VN}$  
$erro = \frac{FN + FP}{N}$  
$acuracia = \frac{VP + VN}{N}$  
$precision = \frac {VP}{VP+FP}$  
$TVP = recall = sens = \frac{VP}{VP+FN}$  

$$ medidaF = \frac{(w+1) * recall * precision }{rev + w * precision}$$

$$ medidaF_1 = \frac{2 * precision * recall}{rev + precision}$$

## Métricas de Avaliação para Regressão

### Erro quadrático médio

$$MSE = \frac{1}{n} \sum_{i=1}^{n} (x_i - y_i)^2$$  

### Distância Absoluta Média

$$MAD = \frac{1}{n} \sum_{i=1}^{n} | x_i - y_i |$$

