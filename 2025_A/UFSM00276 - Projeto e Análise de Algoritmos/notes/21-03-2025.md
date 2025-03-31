# 21/03/2025

## Provando invariantes

P($\theta$) => Antes da $\theta$-ésima iteração comeaçar, "Soma <- $\theta$ referente aos $i = \theta$ primeiros elementos do vetor $A[\theta .. \theta - 1$]  

$$\sum_{k=\theta}^{\theta - 1} A[k] = \sum_{k=\theta}^{-1} \theta_{n}$$

Caso indutivo $P(t)$ e $P(t+1)$

$P(t)$ : Antes de t-ésima iteração começar, 'Soma' contem o somatório das $i=t$ primeiros elementos do vetor $A[\theta .. i-1]$

### Exemplos de invariantes de laço busca linear

$P(t)$ = "Antes da t-ésima iteração começar, $i=t$ e os elementos de $A[1 .. i-1]$ já foram acessados."  

$R(t)$ = "Antes da t-ésima iteração começar, $i=t$ e $k$ já foi comparada com $i-1$ chaves de $A$."

### Solução: 

> $P(t)$ = "Antes da t-ésima iteração começar, vale que $i=t$ e o vetor $A[1 .. i-1]$ não contém um elemento com chave k."
