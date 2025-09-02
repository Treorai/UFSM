# Capítulo 3 - Relações de Equivalência

## Fluxo de caixa e simbologia

>"Não se soma ou subtrai quantias em dinheiro que não estejam na mesma data.

### Diagrama de Fluxo de Caixa

Representação Gráfica do fluxo de caixa atravez de vetores em uma reta horizontal.

| Simbolo | Descrição | Aplicação |
|:-:|:-|:-|
| J | Juros |
| i | Taxa de juros |
| n | Números de períodos de tempo |
| P | Valor presente | Vetor no período $0$ |
| F | Valor futuro | $F_n$ Qualquer outro vetor que não seja no período $0$ |
| U | Série uniforme | Grupo de vetores distribuídos de $n_1$ à $n_n$ |
| U' | Série uniforme antecipada | *"U com entrada"*: distribuído de $n_0$ à $n_{n-1}$ |
| G | Série gradiente aritmética | Começa em $n_2$; $n_1 =0$; $n_2$ batiza a distribuiída e soma nos seguintes $n$'s |
| g | Série gradiente geometrica | |

## F dado P e P dado F

$$F=P\cdot(1-i)^n$$
$$\displaystyle P=F\cdot \frac{1}{(1-i)^n}$$

> Para tabela financeira: $F=P(F/P; i; n)$

### Exemplo

> Uma industria contraiu um empréstimo de R$: 20000.00 para ser devolvido em 6 meses. Qual o montante a ser devolvido se a taxa de juros deste empréstimo é de 5.6% a.m.?

$F=P(1+i)^n$  
$F=20000(1+0.056)^6$  
$F=27734.06$

## F dado U e U dado F

$$F_n=U\cdot \frac{(1+i)^n-1}{i}$$

> Somente para $F_n$

$$U=\frac{F_n\cdot i}{(1+i)^n-1}$$

### Exemplo

> Se um investidor aplicar R$: 2000.00 por mês, durante 2 anos em uma aplicação que lhe renderá 0.5% a.m., qual o montante que ele terá disponível daqui a 2 anos?

$F_n=U\cdot \frac{(1+i)^n-1}{i}$

$\displaystyle F_{24}=2000\cdot \frac{(1+0.005)^{24}-1}{0.005}$

$F= 50863.91$

## P dado U e U dado P

$$P=U\cdot \frac{(1+i)^n-1}{i\cdot(1+i)^n}$$

$$U=P\cdot \frac{i\cdot(1+i)^n}{(1+i)^n-1}$$

> Um empresario pretende fazer um investimento hoje no exterior que va lhe gerar um valor de US$12000 por mes, nos próximos 2 anos. Qual o valor a ser investido hoje,, sabendo que a tx de juros é de 1% a.m. e que após o ultimo saque o saldo será 0?

> As condições para comprar uma máquina industrial exigem como entrada o valor de R$ 10000.00. No entanto, foi permitido ao comprador parcelar este valor em 3 vezes, sem entrada. De quanto deve ser a prestação exigida se a taxa de juros é de 2% a.m.?

$\displaystyle U=P\cdot \frac{i\cdot(1+i)^n}{(1+i)^n-1}$  
$\displaystyle U=10000\cdot \frac{0.02\cdot(1+0.02)^3}{(1+0.02)^3-1}$  
$\displaystyle U=3467.55$

## F dado U' e U' dado F

$$F_{n-1}=U'\cdot \frac{((1+i)^n-1)\cdot (1+i)}{i}$$

$$U'= F_{n-1}\cdot \frac{i}{((1+i)^n-1)\cdot (1+i)}$$

### Exemplo

> O contrato de compra de um equipamento industrial preve um pagamento no valor de 9000.00 no momento da entrega, que ocorre no mes 3. No entento, o comprador propôs parcelar este valor em 3 vezes, com o primeiro pagamento no mês zero. De quanto deve ser a prestação exigida se a TMA é de 2% a.m.?

$\displaystyle U'= F_{n-1}\cdot \frac{i}{((1+i)^n-1)\cdot (1+i)}$  
$\displaystyle U'= 9000\cdot \frac{0.02}{((1+0.02)^3-1)\cdot (1+0.02)}$  
$2883.13$


## P dado U' e U' dado P

## U dado U' e U' dado U

## F dado G

## P dado G

## U dado G

## Gradientes Geinpetrucis

## Séries Perpétuas

## Séries Irregulares

## Tabelas Financeiras
