# UFSM00038 - Equações Diferenciais I

## 1. Equações diferenciais de 1ª ordem

Forma geral:
$\displaystyle\frac{dy}{dt} = f(t,y)$

### **1.1 Separáveis**

Forma:
$\displaystyle\frac{dy}{dt} = g(t),h(y)$

Método:
$\displaystyle\frac{1}{h(y)}dy = g(t),dt \Rightarrow \int \frac{1}{h(y)}dy = \int g(t)dt$

Ideia: separar tudo de (y) de um lado e tudo de (t) do outro.

### **1.2 Lineares de 1ª ordem**

Forma padrão:
$\displaystyle\frac{dy}{dt} + p(t)y = q(t)$

#### Homogêneas

$$y(t) = c\cdot e^{\int q(t)dt}$$

#### Não Homogêneas


Método fator integrante:

$\displaystyle\mu(t)=e^{\int P(t)dt}$

$$y\mu = \int q(t)\mu(t),dt$$

### **1.3 Exatas**

Forma:
$M(x,y)dx + N(x,y)dy = 0$

Condição de exatidão:
$\displaystyle\frac{\partial M}{\partial y} = \frac{\partial N}{\partial x}$

Método:

* Existe função potencial (F(x,y)) tal que:
  $dF = Mdx + Ndy \Rightarrow F(x,y)=C$

Passos:

1. Integra $M$ em relação a $x$
2. Ajusta com função de $y$
3. Usa $N$ para encontrar essa função

---

## 2. Equações diferenciais de 2ª ordem

Forma geral:  
$a y'' + b y' + c y = f(t)$

### **2.1 Lineares homogêneas**

$a y'' + b y' + c y = 0$

Equação característica:

$ar^2+br+c=0$

Casos:

**1. Duas raízes reais distintas**
$y = C_1 e^{r_1 t} + C_2 e^{r_2 t}$

**2. Raiz dupla**
$y = (C_1 + C_2 t)e^{rt}$

**3. Raízes complexas**
$r = \alpha \pm i\beta \Rightarrow y = e^{\alpha t}(C_1\cos\beta t + C_2\sin\beta t)$

### **2.2 Lineares não homogêneas**

$a y'' + b y' + c y = f(t)$

Solução geral:  
$y = y_h + y_p$

* $y_h$: solução da homogênea
* $y_p$: solução particular

#### Método dos coeficientes a determinar

Usado quando (f(t)) é:

* polinômio
* exponencial
* seno/cosseno

Exemplo de chute:

* $f(t)=e^{at} \Rightarrow y_p = Ae^{at}$
* $f(t)=\sin t \Rightarrow y_p = A\sin t + B\cos t$

#### Método da variação de parâmetros