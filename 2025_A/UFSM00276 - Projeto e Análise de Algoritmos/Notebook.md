# Projeto e Análise de Algoritmos

## 19/03/2025

### Introdução à Corretude

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

> Números ou Vetor de números. Não é especificado no problema quem fornece o array.'

>> Tamanho de A >= 1

O que o algoritmo deve fazer para cada entrada válida?

> Somar o valor total, Somar uma unidade para média, dividir pelo total para média.

>> Inicializa soma = 0  
>> Percorre cada elemento de A e acc. Soma  
>> Calcula a média soma/n  
>> Retorno da média  

Como garantir que o algoritmo sempre termina?  

> Lista finita

>> Progresso: a cada iteração i = i+1  
>> condição de parada: assumo n finito, portanto laço termina

Como garantir que o algoritmo produz a saída correta?  

> Lista existe e não é vazia, valores da lista são números

>> | Caso | Resultado |
>> | :- | :- |
>> | Caso Base (n=1) | O único valor no vetor é a média |
>> | Caso geral (n>1) | O laço soma todos os valores de A<br>A média é soma/n<br>É correto, termina |

## 21/03/2025

### Provando invariantes

P($\theta$) => Antes da $\theta$-ésima iteração comeaçar, "Soma <- $\theta$ referente aos $i = \theta$ primeiros elementos do vetor $A[\theta .. \theta - 1$]  

$$\sum_{k=\theta}^{\theta - 1} A[k] = \sum_{k=\theta}^{-1} \theta_{n}$$

Caso indutivo $P(t)$ e $P(t+1)$

$P(t)$ : Antes de t-ésima iteração começar, 'Soma' contem o somatório das $i=t$ primeiros elementos do vetor $A[\theta .. i-1]$

### Exemplos de invariantes de laço busca linear

$P(t)$ = "Antes da t-ésima iteração começar, $i=t$ e os elementos de $A[1 .. i-1]$ já foram acessados."  

$R(t)$ = "Antes da t-ésima iteração começar, $i=t$ e $k$ já foi comparada com $i-1$ chaves de $A$."

Solução: 

> $P(t)$ = "Antes da t-ésima iteração começar, vale que $i=t$ e o vetor $A[1 .. i-1]$ não contém um elemento com chave k."

## 26/03/2025

Uma revisão matemática.

### Somatórios

$$\sum_{i=1}^{n} a_i$$

$i$ : índice  
$n$ : limite superior  
$a$ : termo geral  
$1$ : limite inferior  

>Exemplo:  
>$\sum_{i=1}^{4} i² = 1²+2²+3²+4²=30$

Como converter uma sequência de soma em um somatório:  
- Encontrar a fórmula do termo geral $a_i$
- Determinar o valor inicial e o valor final de $i$

> Exemplo 1:  
> $2 + 4 + 6 + 8 + ... + 200$  
>
> 1. Termo Geral: $2i$  
> 2. $i_0 = 1$, $i_n = 100$
> 
> Então:  $\sum{i=1}^{100} 2i$  

> Exemplo 2:  
> $1,05¹ + 1,05² + 1,05³ + ... + 1,05¹2  
>
> 1. $a_i = 1,05^i$  
> 2. $i_0 = 1$, $i_n = 12$  
> 
> Então: $\sum_{i=1}^{12} 1,05^i$  

> Exemplo 3:  
> $1 + 3 + 5 + 7 + 9 + ... + 99$  
>
> 1. $a_i = 2_i - 1$  
> 2. $i_0 = 1$, $i_n = ?$
>
>> Se não soubermos qual é o $a_n$, pegamos o último termo e aplicamos no termo geral:  
>> $a_n = 2n - 1$
>> $99 = 2n - 1$
>> $n = 50$
> 
> Então: $\sum_{i=1}^{50} (2i-1)$

#### Propriedades Arit.
1. $\sum_{i=1}^{n} (a_i + b_i) = \sum_{i=1}^{n} a_i + \sum_{i=1}^{n} b_i$  
2. $\sum_{i=1}^{n} (a_i - b_i) = \sum_{i=1}^{n} a_i - \sum_{i=1}^{n} b_i$
3. $\sum_{i=1}^{n} c a_i = c (\sum_{i=1}^{n} a_i )$

#### Propriedades Elementares

1. $\sum_{i=1}^{k} 1 = n$  
2. $\sum_{i=1}^{k} i = \frac{n(n+1)}{2}$  
3. $\sum_{i=1}^{k} 2^{k+1}-1$  
4. $\sum_{i=1}^{k} \frac{1}{2i} = 2 - \frac{1}{2^k}$  
5. $\sum_{i=0}^{k} a_i = \frac{a^{k+1}-1}{a_i - 1}$  
6. $\sum_{i=1}^{k} i^{2} = \frac{n(n+1)(2n+1)}{6}$  

#### Demonstração

Calcule $\sum_{i=1}^{50} (2i-1)$  

$\sum_{i=1}^{50} (2i-1) = \sum_{i=1}^{50} 2i - \sum_{i=1}^{50} 1 = 2 \sum_{i=1}^{50} i - \sum_{i=1}^{50} 1 = 2(\frac{n(n+1)}{2}) - n = 2(\frac{50(50+1)}{2}) - 50 = 2500$  

Calcule $\sum_{i=1}^{60} (\frac{i}{2} + 1)$  

$\frac{1}{2} \sum_{i=1}^{60} i + \sum_{i=1}^{60} 1$  

> Aplica-se a prop.2  

$\frac{1}{2} \frac{n(n+1)}{2} + n$  

$\frac{60^2+60}{4} + 60 = 975$  

Calcule $\sum_{i=11}^{40} 6(i - \frac{1}{4})$  

$\sum_{i=11}^{40} 6i - \sum_{i=11}^{11} \frac{3}{2}$  

$6 \sum_{i=11}^{40} i - \frac{3}{2} \sum_{i=11}^{40} 1$  

$( 6 \sum_{i=1}^{40} i - \frac{3}{2} \sum_{i=1}^{40} 1$ ) - ( $6 \sum_{i=1}^{10} i - \frac{3}{2} \sum_{i=1}^{10} 1 )$  

$( 6 \sum_{i=1}^{40} \frac{n(n+1)}{2} - \sum_{i=1}^{40} 1 ) - ( 6 \sum_{i=1}^{10} \frac{n(n+1)}{2} - \sum_{i=1}^{10} 1 )$  

$( 6 \frac{40(41)}{2} - frac\{3}{2} 40 ) - ( 6 \frac{10(11)}{2} - 15 )$  

$6 ( 820) - 60  - 6 (55 - 15 )$  

$4860 - 6 (40)$  

$4680 - 240$

:x: $4440$

#### Correção:

$\sum_{i=11}^{40} 6 (i-\frac{1}{4}) =$  
$\sum_{i=11}^{40} 6i - \sum_{i=11}^{40} \frac{1}{4} =$  
<!-- $6 \sum_{i=11}^{40} i - 6 \sum_{i=11}^{40} \frac{1}{4} =$   -->
$( \sum_{i=1}^{40} 6i - \sum_{i=1}^{40} 6(\frac{1}{4} ) - ( \sum_{i=1}^{10} 6i - \sum_{i=1}^{10} 6(\frac{1}{4}) ) =$  
$( 6 \sum_{i=1}^{40} i - \sum_{i=1}^{40} \frac{3}{2} ) - ( 6 \sum_{i=1}^{10} i - \sum_{i=1}^{10} \frac{3}{2} ) =$  
$6 \sum_{i=1}^{40} i - \sum_{i=1}^{40} \frac{3}{2} - 6 \sum_{i=1}^{10} i + \sum_{i=1}^{10} \frac{3}{2} =$  
$6 \frac{40(41)}{2} - \frac{3}{2} 40 - 6 \frac{10(11)}{2} + \frac{3}{2} 10 =$  
$4920 - 60 - 336 + 15 =$  
:heavy_check_mark: $4545

## 28/03/2025

### Indução Matemática

#### Exemplo Motivacional:  

$1 = 1$  
$1 + 3 = 4$  
$1 + 3 + 5 = 9$  
$1 + 3 + 5 + 7 = 16$  

Observamos que "A soma dos n primeiros números ímpares = $n^2$ "  

Caso base: é a prova que a propriedade vale (é verdadedeira) para o menor valor.  

Passo Indutivo:  
- *Hipótese de indução*: assume-se que a propriedade é válida para um determinado valor $k$
- *Tese*: provar que a propriedade é válida para $k+1$

Queremos provar que a igualdade $1+3+5+...+(2n-1)$ é verdade.  

**Caso base**:  
$n=1$; $2(1) -1 = 1 = 1$  

**Passo Indutivo**:  
$n=k$; $1+3+5+...+(2k-1) = k^2$  

**Tese**:  
$n=k+1$; $1+3+5+...+(2k-1)+(2k+1) =$  
$(k^2) + (2k+1) =$  
$k^2 + 2k + 1 =$  
**$(k+1)^2$**  

#### Exercício

$\sum_{i=1}^{n} {i} = \frac{n(n+1)}{2}$  
$1+2+3+...+n = \frac{n(n+1)}{2}$  

**Caso base**:  
✔️ $n=1$; $\frac{1(1+1)}{2} = 1 = 1$  

**Passo Indutivo**:  
✔️ $n=k$; $1+2+3+...+\frac{k(k+1)}{2} = 1+2+3+...+k = \frac{k^2 + k}{2}$  

**Tese**:  
✔️ $n=k+1$; $1+2+3+...+k+ k+1$  
❌ $\frac{k^2 + k}{2} = \frac{(k+1)((k+1)+1)}{2}$  
> $\frac{k^2 + k}{2} + k+1 = \frac{k(k+1)+2(k+1)}{2}$  
<!--
$\frac{k^2 + k}{2} = \frac{(k^2+k)+k)+(k+1)+1}{2}$  

> $\frac{k^2 + k}{2} = \frac{k^2+k+k+k+1+1}{2}$  
> $\frac{k^2 + k}{2} = \frac{k^2+3k+2}{2}$  
  
> $\frac{k^2 + k}{2} = \frac{k^2 + 2k + 1 + k + 1}{2}$  
> $\frac{k^2 + k}{2} = \frac{k^2 + 3k + 2}{2}$  

$\frac{k^2 + k}{2} = \frac{k^2 + 3k + 2}{2}$  
$\frac{k(k+1)}{2} = \frac{(k+1)(k+2)}{2}$  
$k=k+2$  

$k = 3k+2$  
$2k= -2$  
$k = -1$
-->

$\frac{k(k+1)+2(k+1)}{2} = \frac{(k+1)((k+1)+1)}{2}$  
$\frac{k(k+1)+2(k+1)}{2} = \frac{(k+1)(k+2)}{2}$  
$\frac{k(k+1)+2k+2)}{2} = \frac{(k+1)(k+2)}{2}$  
$\frac{k^2+3k+2}{2} = \frac{k^2+3k+2}{2}$  

Provado! :)
