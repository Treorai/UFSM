# Aula 1 02/03/20226

## Transformada de Laplace

$$\mathcal{L} \left[f(t)\right] = F(s) = \int_{0-}^{\infty} f(t)e^{-st}dt$$

$$\mathcal{L}^{-1} \left[F(s)\right] = f(t)u(t) = \frac{1}{2\pi j} \int_{\sigma-j \infty}^{\sigma +j \infty} F(s)e^{st}ds$$

---

## Propriedades e teoremas das transformadas de Laplace

### Teorema da linearidade

$$\mathcal{L}[k f(t)] = kF(s)$$

$$\mathcal{L}[f_1(t) + f_2(t)] = F_1(s) + F_2(s)$$

### Teorema de deslocamento de frequência

$$\mathcal{L}[e^{-at} f(t)] = F(s + a)$$

### Teorema de derivação

$$\mathcal{L}\left[\frac{d^n f}{dt^n}\right]=s^n F(s)-\sum_{k=1}^{n} s^{\,n-k} f^{(k-1)}(0)$$

### Teorema de integração

$$\mathcal{L}\left[\int_{0}^{t} f(\tau)\, d\tau \right]=\frac{F(s)}{s}$$

### Teorema do valor final

$$f(\infty) = \lim_{s \to 0} sF(s)$$

### Teorema do valor inicial

$$f(0) = \lim_{s \to \infty} sF(s)$$

---

## Tabela de Transformadas de Laplace

