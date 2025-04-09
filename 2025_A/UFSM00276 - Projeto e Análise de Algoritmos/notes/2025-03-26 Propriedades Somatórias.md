# 26/03/2025

## Revisão matemática.

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
