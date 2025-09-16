# Formulário

## Capítulo 1 - Juros

## Capítulo 2 - Taxas e Custo

## Capítulo 3 - Relações de Equivalência

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

## $F \leftrightarrow P$

$$F=P\cdot(1-i)^n$$
$$\displaystyle P=F\cdot \frac{1}{(1-i)^n}$$

## $F \leftrightarrow U$

$$F_n=U\cdot \frac{(1+i)^n-1}{i}$$

> Somente para $F_n$

$$U=\frac{F_n\cdot i}{(1+i)^n-1}$$

## $P \leftrightarrow U$

$$P=U\cdot \frac{(1+i)^n-1}{i\cdot(1+i)^n}$$

$$U=P\cdot \frac{i\cdot(1+i)^n}{(1+i)^n-1}$$


## $F \leftrightarrow U'$

$$F_{n-1}=U'\cdot \frac{((1+i)^n-1)\cdot (1+i)}{i}$$

$$U'= F_{n-1}\cdot \frac{i}{((1+i)^n-1)\cdot (1+i)}$$

## $P \leftrightarrow U'$

$$ P=U' \cdot \frac{(1+i)^n -1}{i\cdot (1+i)^{n-1}}$$

$$ U'=P \cdot \frac{i\cdot (1+i)^{n-1}}{(1+i)^n -1}$$

## $U \leftrightarrow U'$

$\displaystyle U = U' \cdot (1+i)$  

$\displaystyle U' = \frac{U}{1+i}$  

## $G \mapsto F$

$$F=G\cdot \left ( \frac{(1+i)^n-1-n\cdot i}{i^2} \right)$$


## $G \mapsto P$

$$P=G\cdot \left ( \frac{(1+i)^n-1}{i^2} - \frac{n}{i} \right) \cdot \left ( \frac{1}{(1+i)^n} \right)$$

## $G \mapsto U$

$$U=G\cdot \left ( \frac{1}{i}-\frac{n}{i}\cdot \frac{i}{(1+i)^n -1} \right)$$

## Gradientes Geométricos

$$P= \frac{F_1}{1+g} \cdot \frac{\left (\displaystyle \frac{1+g}{1+i} \right)^n\cdot\displaystyle\frac{1+g}{1+i}-\frac{1+g}{1+i}}{\displaystyle\frac{1+g}{1+i}-1}$$


$$P=\frac{F_1}{1+i}\cdot \frac{\left (\displaystyle \frac{1+g}{1+i} \right)^n-1}{\displaystyle \frac{1+g}{1+i}-1}$$


## Séries Perpétuas

$$P= \frac{U}{i}$$

$$U= P\cdot i$$