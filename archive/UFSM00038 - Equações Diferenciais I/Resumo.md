# Classificação das Equações Diferenciais

- **Ordem** → Maior derivada presente
- **Grau** → expoente da maior derivada na forma normal
- **Linearidade** → Uma ED é **linear** se (y) e derivadas aparecem em potência 1, sem produtos entre si.

Forma geral linear de ordem n:

$\displaystyle a_n(x)y^{(n)}+a_{n-1}(x)y^{(n-1)}+\dots+a_1(x)y'+a_0(x)y=g(x)$

---

# Equações de Primeira Ordem

## Separáveis (não lineares)

Forma:

$\displaystyle \frac{dy}{dt}=g(t)h(y)$ → $\displaystyle \frac{dy}{h(y)}=g(t)dt$

Solução:

$\displaystyle \ln|y|= \int{g(t)}+c$

$S:\color{purple} \displaystyle y(t)=c\cdot e^{\int{g(t)}}$

---

## Lineares

Forma:

$\displaystyle y'+a(t)y=b(t)$

### Fator integrante:

$\color{blue} \displaystyle \mu(t)=e^{\int a(t)dt}$

Solução:

$\color{purple} \displaystyle y\mu=\int \mu b(t)dt + C$

---

## Exatas

Forma:

$\displaystyle M(x,y)+N(x,y)y'=0$

Verificar:

$\color{blue} \displaystyle \frac{\partial M}{\partial y}=\frac{\partial N}{\partial x}$

Se sim, é exata.

Existe função $\psi(x,y)$ tal que:

$\displaystyle d\psi = Mdx+Ndy$

Solução:

$S:\color{purple} \displaystyle \psi(x,y)=C$

Resolução:

$\displaystyle N (x,y) = \frac{\partial}{\partial y} {\int{M(x,y)dx}}+ \frac{\partial}{\partial y} C(y)$

---

# Equações de Segunda Ordem

Forma geral:

$\displaystyle y''+ay'+by=f(x)$

---

## Solução Homogênea

$\displaystyle y''+ay'+by=0$

Equação característica:

$\color{blue} \displaystyle r^2+ar+b=0$

### Raízes reais diferentes:

$\displaystyle S: \color{purple} y(t)=c_1e^{r_1t}+c_2e^{r_2t}$

### Raízes reais iguais:

$\displaystyle S: \color{purple}  y(t)=(c_1+c_2t)e^{rt}$

### Raízes Complexas:

$r_{1,2}=\lambda \pm \mu i$

$\displaystyle S: \color{purple}  y(t)=e^{\lambda t}(c_1\cos \mu t + c_2\sin \mu t)$

---

## Solução Não-homogênea

Forma:

$S: \displaystyle y(t) = Y_h(t) + Y_P(t)$

### Método dos Coeficientes Indeterminados

$\displaystyle ay''+by'+cy=g(t)$

---

#### Tabela de Hipóteses

| $g(t)$                         | $Y(t)$                    |
| ------------------------------ | ------------------------- |
| $k$                            | $A$                       |
| $e^{at}$                       | $Ae^{at}$                 |
| $t e^{at}$                     | $(At+B)e^{at}$            |
| $\sin \beta t$       | $A\cos \beta t+B\sin \beta t$       |
| $\cos \beta t$       | $A\cos \beta t+B\sin \beta t$       |
| $t^n$                          | polinômio mesmo grau n    |

Se repetir termo da homogênea: multiplicar por (t).

---

### Método da Variação de Parâmetros

Para:

$\displaystyle y''+p(t)y'+q(t)y=g(t)$

Se $y_1,y_2$ são soluções homogêneas:

$\color{blue} \displaystyle Y_p=u_1y_1+u_2y_2$

Onde:

$\color{blue} \displaystyle u_1'=\frac{-g(t) \cdot y_2}{W}$

$\color{blue} \displaystyle u_2'=\frac{g(t) \cdot y_1}{W}$

Wronskiano
$\displaystyle W=y_1y_2'-y_2y_1'$

Solução:

$S: \color{purple} \displaystyle Y_p =\int{\frac{-g(t) \cdot y_2}{y_1 y_2'- y_2 y_1'}} dt \cdot y_1 +\int{\frac{ g(t) \cdot y_1}{y_1 y_2'- y_2 y_1'}} dt \cdot y_2$

---

## Oscilador Harmônico

Modelo:

$\displaystyle m x'' + c x' + k x = F(t)$

Onde:

* $m$ → massa
* $c$ → amortecimento
* $k$ → mola
* $F(t)$ → força externa

### Caso Livre sem amortecimento

$\displaystyle mx''+kx=0$

$\displaystyle x''+\omega^2x=0$

$\displaystyle \omega=\sqrt{\frac{k}{m}}$

Solução:

$\displaystyle x=C_1\cos(\omega t)+C_2\sin(\omega t)$

---

### Caso Amortecido

$\displaystyle mx''+cx'+kx=0$

Equação característica:

$\displaystyle mr^2+cr+k=0$

$\displaystyle r_{1,2}=\frac{-c \pm \sqrt{c^2-4km}}{2m}$

| Caso | $\Delta$ | $x(t)$ | Comportamento |
| :- | :- | :- | :- |
| Superamortecido | $\displaystyle c^2>4mk$ | $x(t)=Ae^{r_1t}+Be^{r_2t}$ | Queda exponencial sem oscilar |
| Criticamente amortecido | $\displaystyle c^2=4mk$ | $x(t)=Ae^{\frac{-c}{2}t}+t\cdot Be^{\frac{-c}{2}t}$ |Queda após pico sem oscilar |
| Subamortecido | $\displaystyle c^2<4mk$ | $e^{\frac{-c}{2}t}(A\cdot cos(\frac{\sqrt{4km-c^2}}{2m}\cdot t)+B\cdot sin(\frac{\sqrt{4km-c^2}}{2m}\cdot t))$ | Oscila com amplitude decrescente. |

### Ressonância

$\displaystyle mx''+cx'+kx=F_0\cos(\omega t)$

Ocorre quando frequência externa ≈ natural.
