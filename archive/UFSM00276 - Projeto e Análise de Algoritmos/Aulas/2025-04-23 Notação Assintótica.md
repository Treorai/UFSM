# 23/04/2025

## $$O$$ (Big Omicron)

### Operações com Notação $O$

## $$\Theta$$ (Theta)

### Operações com Notação $\Theta$

$\Theta(g(n)) = {f(n): \exists c,n_0 > 0:0 < f(n) \le c \times }$  

## $$\Omega$$ (Omega)

### Operações com Notação $\Omega$


$\sum^n_{i=1} i$

### Algoritmo A
```
function sumA(n)
soma=0
for i=1 to n
  for j=1 to i
    soma=soma+1
return soma
```

### Algoritmo B
function sumB(n)
```
soma=0
for i=1 to n
  soma = soma+i
return soma
```

### Algoritmo C
function sumC(n)
```
return n(n+1)/2
```

## Comparação

|Algoritmo|A|B|C|
|:-|:-:|:-:|:-:|
| Atribuições | $1+n(n+1)\div2$ | $n+1$ | $1$ |
| Adições | $n(n+1)\div2$ | $n$ | $1$ |
| Multiplicações | | | 1 |
| Divisões | | | 1 |
| Total de Operações | $n^2+n+1$ | $2n+1$ | $4$ |
| $O$ | $O(n^2)$ | $O(n)$ | $O(1)$ |

## Revisão

> Capítulos 2 e 3 (Cormen et al. 2009)
