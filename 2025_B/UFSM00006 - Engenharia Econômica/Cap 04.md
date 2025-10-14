# Capítulo 4 - Financiamentos

## Sistemas de Amortização

$P_t=a_t+J_t$  
$J_t=SD_{t-1}\cdot i$  
$SD_t=SD_{t-1}-a_t$  


p=prestação
J juros
i taxa juros
SD saldo devedor
a= amortização
t= tempo

### Francês

$J_t=SD_{t-1}\cdot i$  
$a_t=p_t-J_t$  
$SD_t=SD_{t-1}-a_t$  
$\displaystyle P_t= SD_0\cdot \frac{i(1+i)^n}{(1+i)^n-1}$  
${\color{red}\displaystyle SD_t=p_t\cdot \frac{(1+i)^{n-t}-1}{i(1+i)^{n-t}}}$  

### Constante

$J_t=SD_{t-1}\cdot i$  
$a_t=\frac{SD_0}{n}$  
$SD_t=SD_{t-1}-a_t$  
$P_t= a_t+J_t$  
${\color{red}SD_t=SD_0 -a_t \cdot t}$  
${\color{red}\displaystyle P_t=SD_0 \cdot \left( \frac{1}{n}+i\cdot\frac{n-t+1}{n}\right)}$

### Misto

$J_t=SD_{t-1}\cdot i$  
$a_t=p_t-J_t$  
$SD_t=SD_{t-1}-a_t$  
$\displaystyle p_t= \frac{SD0}{2}\cdot \left ( \left ( \frac{i\cdot (1+i)^n}{(1+i)^n-1} \right) + \left ( \frac{1}{n}+ i- \frac{i\cdot t- i}{n} \right) \right)$

### Crescente

$J_t=SD_{t-1}\cdot i$  
$a_t=P_t-J_t$  
$SD_t=SD_{t-1}-a_t$  
$\displaystyle P_t= \frac{SD_0}{n} + (SD_0\cdot i)$  
$P_n=SD_{n-1}+J_n$  

### Americano


$J_t=SD_{t-1}\cdot i$  
$a_t=P_t-J_t$  
$SD_t=SD_{t-1}-a_t$  
$P_t=SD_0\cdot i$  
$P_n=SD_0 \cdot (1+i)$  

### Pagamento Único com juros postecipados

$J_t=SD_{t-1}\cdot i$  
$a_t=P_t-J_t$  
$SD_t=SD_{t-1}-a_t$  
$P_t=0$  
$P_n=SD_0 \cdot (1+i)^n$ 

### Pagamento Único com juros antecipados

$P_0=SD_0 \cdot (1+i)^n -SD_0$  
$P_n=SD_0$  

### Sistema de Amortizações Variáveis

$J_t=SD_{t-1}\cdot i$  
$a_t=P_t-J_t$  
$SD_t=SD_{t-1}-a_t$  
