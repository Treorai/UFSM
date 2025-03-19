# 19/03/2025

## Introdução à Corretude

Um algoritmo deve ser:

:heavy_check_mark: Bem definido, claro, sem ambiguidade.  
:heavy_check_mark: Finito. Deve terminar em um número de passos.  
:heavy_check_mark: Compuitacional: Executável por um computador.  

### Representação de algoritmos:

| Descrição narrativa | Fluxogramas | Português estruturado (pseudocódigo) |
| :- | :- | :- |
| Representação puramente textual <br>Usa a linguagem natural (pt-br) | Representação Gráfica <br>Mais legível para humanos | Representção textual <br> Mais próxima do computador |

### Corretude

Um algorítmo está correto se, para todas entradas válidas, ele produz a saída esperada.

### Eficiência

Um algoritmo é eficiente conforme usa menos tempo e menos memória.

| Exemplo de Busca | Descrissão | Complexibilidade |
| :- | :- | :- |
| Busca Linear | Percorre o array elemento por elemento | O(n) |
| Busca Binária | Divide o vetor ao meio a cada iteração | O(log n) |
| Bubble Sort | Ordenação com o algoritmo de bolha | O(n²) |
| Merge Sort | Ordenação com o algoritmo Merge sort | O(n log n) |

### Clareza

Um algoritmo claro é bem escrito e organizado.  

- Usar nomes descritivos para variáveis e funções
- Dividir o algoritmo em etapas claras
- Comentar o código para explicar raciocínio

### Generalidade

Um algoritmo genérico funciona ṕara diferentes tamanhos de entrada e tipos de dados.  

> Indução (matemática discreta) é uma das formas de garantir corretude de um algoritmo.

Para provar, infermalmente, a corretude de um algoritmo podemos fazer as seguintes perguntas:

- Quais são as entradas válidas para o algorítmo?
- O que o algoritmo deve fazer para cada entrada válida?
- Como garantir que o algoritmo sempre termina?  
- Como garantir que o algoritmo produz a saída correta?  

### Exercício

Implemente um algoritmo, em pseudocódigo, que **calcula a média dos valores de um array** de números de qualquer tamanho.

```c
# Algorithm 1
Require: Lista de números ou números para pôr em lista.
Ensure: Retorna o valor da média dos números.

indice ← 0
n ← tamanho(lista)
soma

while indice < n do
  soma += lista[indice]
  indice++;
end while

return soma/indice;
```

Quais são as entradas válidas para o algorítmo?

> Números ou Vetor de números. Não é especificado no problema quem fornece o array.

O que o algoritmo deve fazer para cada entrada válida?

> Somar o valor total, Somar uma unidade para média, dividir pelo total para média.

Como garantir que o algoritmo sempre termina?  

> Lista finita

Como garantir que o algoritmo produz a saída correta?  

> Lista existe e não é vazia, valores da lista são números
