# Simulações LTspice

## Simulação 1

- Analisar o circuito e determinar o fator de potência
- Realizar a simulação e analisar a defasagem entre $v_s(t)$ e $i_s(t)$

$V_s(t)=V_m cos(2\pi f_s t)$   
$V_m=1V (2V_{pp})$  
$f_s=100kHz$  
$L=1mH$  
$R=1k\ohm$

### Resistor shunt

Resistor para medição. Emprego para medir a corrente $I_s = V_{sh}/R_{sh}$
$R_{sh}=10\ohm$

### Cálculos

> Cálculo do circuito desconsiderando o shunt

$V_s=1<0° V$  
$V_{s,rms}= \frac{1}{\sqrt 2 }$  
$f=100kHz$  
$w=2\pi f$  
$X_L = w.L$  
$Z_L = R+jX_L$  
$S=\frac{V_{s,rms}}{Z_L *}=P+jQ$  
$FP=\frac{P}{S}$  

> Análise do circuito

$V_{s,rms}=\frac{V_s}{\sqrt 2}$  
$X_L=wsL$  
$Z=R+j X_L = 1000+j628.32$  
$S=V_{s,rms}^2=Z*$  
$P=358.48e^{-6}$  

### Configuração de Componentes

- Fonte

<img width="596" height="472" alt="image" src="https://github.com/user-attachments/assets/275367e2-3552-4794-83ce-8f4b30d52c38" />

$Stop = $k T_s$, $k=1, 2, 3,...$  
$Start=h T_s$, $h=1, 2, 3,...$, $h < k$  
$\displaystyle Step=[\frac{T_s}{100} .. \frac{T_s}{1000}]$  

- Setup

$T_s=\frac{1}{f_s}$  
$Stop = 8 T_s$  
$Start = 2 T_s$  
$Step= \frac{T_s}{1000}$  

<img width="547" height="377" alt="image" src="https://github.com/user-attachments/assets/fbf900d9-d4f8-4c62-bf84-f179e1d70c21" />
