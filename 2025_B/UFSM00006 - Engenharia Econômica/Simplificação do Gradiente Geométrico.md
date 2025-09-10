# Simplificação do Gradiente Geométrico

### Autor: Wagner S Chittó


Dada a fórmula original:

> $$P= \frac{F_1}{1+g} \times \frac{\left (\displaystyle \frac{1+g}{1+i} \right)^n\times\displaystyle \left (\frac{1+g}{1+i}\right)-\left (\frac{1+g}{1+i}\right)}{\displaystyle \left (\frac{1+g}{1+i}\right)-1}$$

---

Defini-se que $\displaystyle \frac{1+g}{1+i} = x$ para obter:

> $$P= \frac{F_1}{1+g} \cdot \frac{\left (\displaystyle {\color{yellow}x} \right)^{n}\cdot {\color{yellow}x}-\displaystyle {\color{yellow}x}}{\displaystyle {\color{yellow}x}-1}$$

Pela propriedade matemática:

>$$P=\frac{F_1}{1+g}\cdot \frac{{\color{magenta}x(x^n-1)}}{x-1}$$

Tirando da fração:

>$$P=\frac{F_1}{1+g}\cdot {\color{yellow}x} \cdot\frac{(x^n-1)}{x-1}$$

Voltando a definição anterior para o elemento:

> $$P=\frac{F_1}{1+g}\cdot {\color{magenta}\frac{1+g}{1+i}} \cdot\frac{(x^n-1)}{x-1}$$

Corta:

> $$P=\frac{F_1}{\color{yellow}{1+i}} \cdot\frac{(x^n-1)}{x-1}$$

Finalmente:

> $$P=\frac{F_1}{1+i}\cdot \frac{\left (\displaystyle \frac{1+g}{1+i} \right)^n-1}{\displaystyle \frac{1+g}{1+i}-1}$$
