# 1.

```cpp
Conta(A, ini, fim, x)
  
  cont <- 0                  // O(1)
  
  para i de 1 até fim faça   // O(n)
    Se A[i] = x então        // O(1) - O(n)
      cont <- cont+1         // O(1) - O(n)
  retorne cont               // O(n)
```

$T(n) = 2n + 2$  
$T(n) \in O(n)$  

```cpp
Majoritario(A, ini, fim)
  se ini = fim então
    retorne A[ini]
  meio <- (ini + fim) div 2
  maj_ini <- Majoritario(A, ini, meio)
  maj_fim <- Majoritario(A, meio+1, fim)
  cont_ini <- Conta(A, ini, fim, maj_ini)
  cont_fim <- Conta(A, ini, fim, maj_fim)

  Se cont_ini > (fim - ini+1) div2 então
    retorne maj_ini
  senão se cont_fim > (fim - ini+1)
    retorne maj_fim
  senão se maj_ini = maj_fim então
    retorne maj_fim
  senão
    retorne null
```

$T(n) = 2T(\frac{2}{n} + cn$  
$T(n) = n^{log_b a} = n^{log_2 2} = n^1 = f(n)$  
$T(n) \in O(n log(n) )$  

# 2.

E < B < C < A < D

# 3.
```
1: 1 atribuição  
2: 1 atribuição  
3: i = até n-1 (n iter)  
4: n-1 iter  
5: 1 acesso a A[i]  
   1 acesso a A[j]  
   1 multiplicação A[i] * A[j]  
   1 adição e atribuição  
6: 1 retorno  
```

$T(n) = 2 + n \cdot 4 (n-1) + 1$  
$T(n) = 4n^2 - 4n + 3$  
$T(n) \in O(n^2)$

# 4

Alt. "A"

# 5

$T(n) = 7T(\frac{n}{2} +cn^2$  
  
...  
  
$cn^2(\frac{7}{4})^h$  

h.max:  
$\frac{n}{2^h} = 1$  
$n = 2^h$  
$log(n) = h \cdot log(2)$  
$log(n) = h \cdot log_2 2$  
$h = log(n)$  

$T(n) = cn^2 + \sum_{h=1}^{log(n)} (\frac{7}{4}^)h$  
  
$S = \alpha \cdot \frac{R^{log(n)} - 1}{R - 1} = \frac{7}{4} \cdot (\frac{(\frac{7}{4})^{log(n)} - 1} {\frac{7}{4} - 1})$  
$S = \frac{7}{3} (n \cdot log_2 \frac{7}{4} -1 ) = 2.807$  
  
$T(n) \in O(n^{2{,}807})$
