# 07/05/2025

## Método da Interação

1. Copiar a fórmula original
2. Descobrir o passo
3. Isolar as equações para "os próximos passos"

> Ex: Se $T(n)$ estiver escrito em função de $T(\frac{n}{2}), a cada passo o parâmetro é dividido por 2.

4. Substituir os valores isolados na fórmula original
5. Identificar a fórmula do i-ésimo passo
6. Descobrir o valor de i de forma a igualar o parâmetro de $T(x)$ ao parâmentro (vetor de n) no caso base
7. Substituir o valor de i na fórmula do i-ésimo caso
8. Identificar a complexibilidade dessa fórmula
9. Provar por indução que a equação foi corretamente encontrada

### Exemplo

{ $T(n) = 2T(n-1) + 1$
{ $T(1) = 1$

1. $T(n) = 2T(n-1) + 1$
2. $T(n)$ está em função de $T(n-1)$
3.
  $T(n-1) = 2T(n-2) + 1$  
  $T(n-2) = 2T(n-3) + 1$  
  $T(n-3) = 2T(n-4) + 1$  
  ...
  
4.
  $T(n) = 2T(n-1)+1$  
  $T(n) = 2(2T(n-2)+1)+1$  
  $T(n) = 2^{2}T(n-2)+2+1$  
  $T(n) = 2^{2}(2T(n-3)+1))+2+1$  
  $T(n) = 2^{3}T(n-3)+2^2+2+1$  
  $T(n) = 2^{3}(2T(n-4)+1)+2^2+2+1$  
  $T(n) = 2^{4}T(n-4)+2^3+2^2+2+1$  
  **$T(n) = 2^4T(n-4)+2^4-1$**  
  
5. $T(n) = 2^i T(n-i) + 2^i -1$
  
6.
  $T(n-i) = T(1), T(1) = 1$
  $n-i=1$
  $i=n-1$

7. 
  $T(n) = 2^{n-1}T(1)+2^{n-1}-1$
  $T(n) = 2^n -1$

8. $T(n) \in O(2^n)$

9. $T(n) = 2^n - 1$  
  - Prova para caso base:  
     $T(1)=1$  
     $T(1)=2^1-1 = 1$ ✔️  
    
  - H.I. $T(n-1) = 2^{n-1}-1$  
    $T(n) = 2T(n-1)+1$  
    $T(n) = 2(2^{n-1} -1)+1$  
    $T(n) = 2^n-2+1$  
    $T(n) = 2^n - 1$ ✔️

R.
    Então $2T(n-1) + 1 = 2^n -1$ para $n \ge 1$  
    $T(n) \in O(2^n)$
