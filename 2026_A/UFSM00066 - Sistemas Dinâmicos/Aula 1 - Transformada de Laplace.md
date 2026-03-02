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

$$\mathcal{L}\{f(t)\} = \int_{0}^{\infty} e^{-st} f(t) dt$$

| **f(t)**                             | **F(s)**                                         | **f(t)**                                  | **F(s)**                                                |
|--------------------------------------|-------------------------------------------------|-------------------------------------------|--------------------------------------------------------|
| 1. \(1\)                             | \(\frac{1}{s}\)                                 | 16. \(e^{at} \sin(\omega t)\)             | \(\frac{\omega}{(s-a)^2 + \omega^2}\)                   |
| 2. \(t^n, n = 1, 2, 3, \dots\)      | \(\frac{n!}{s^{n+1}}\)                         | 17. \(e^{at} \cos(\omega t)\)             | \(\frac{s-a}{(s-a)^2 + \omega^2}\)                      |
| 3. \(t^\alpha, \, \alpha > -1\)     | \(\frac{\Gamma(\alpha + 1)}{s^{\alpha+1}}\)    | 18. \(t \sin(\omega t)\)                  | \(\frac{2\omega s}{(s^2 + \omega^2)^2}\)                |
| 4. \(e^{at}\)                        | \(\frac{1}{s-a}\)                              | 19. \(t \cos(\omega t)\)                  | \(\frac{s^2 - \omega^2}{(s^2 + \omega^2)^2}\)           |
| 5. \(t^n e^{at}\)                   | \(\frac{n!}{(s-a)^{n+1}}\)                     | 20. \(\sin(\omega t) - \omega t \cos(\omega t)\) | \(\frac{2\omega^3}{(s^2 + \omega^2)^2}\)         |
| 6. \(\sin(\omega t)\)               | \(\frac{\omega}{s^2 + \omega^2}\)              | 21. \(\sin(\omega t) + \omega t \cos(\omega t)\) | \(\frac{2\omega s^2}{(s^2 + \omega^2)^2}\)        |
| 7. \(\cos(\omega t)\)               | \(\frac{s}{s^2 + \omega^2}\)                   | 22. \(\frac{1}{a-b}(e^{at} - e^{bt})\)    | \(\frac{1}{(s-a)(s-b)}\)                                |
| 8. \(\sinh(\omega t)\)              | \(\frac{\omega}{s^2 - \omega^2}\)              | 23. \(\frac{1}{a^2}(1 - \cos(at))\)       | \(\frac{1}{s(s^2 + a^2)}\)                              |
| 9. \(\cosh(\omega t)\)              | \(\frac{s}{s^2 - \omega^2}\)                   | 24. \(\frac{1}{a^3}(at - \sin(at))\)      | \(\frac{1}{s^2(s^2 + a^2)}\)                            |
| 10. \(e^{at} \sin(\omega t)\)       | \(\frac{\omega}{(s-a)^2 + \omega^2}\)          | 25. \(f(t) + g(t)\)                       | \(F(s) + G(s)\)                                         |
| 11. \(e^{at} \cos(\omega t)\)       | \(\frac{s-a}{(s-a)^2 + \omega^2}\)             | 26. \(f'(t)\)                             | \(sF(s) - f(0)\)                                         |
| 12. \(t \sin(\omega t)\)            | \(\frac{2\omega s}{(s^2 + \omega^2)^2}\)       | 27. \(f''(t)\)                            | \(s^2F(s) - s f(0) - f'(0)\)                            |
| 13. \(t \cos(\omega t)\)            | \(\frac{s^2 - \omega^2}{(s^2 + \omega^2)^2}\)  | 28. \(e^{at} f(t)\)                       | \(F(s-a)\)                                              |
| 14. \(\sin(\omega t) - \omega t \cos(\omega t)\) | \(\frac{2\omega^3}{(s^2 + \omega^2)^2}\)  | 29. \((f*g)(t)\)                          | \(F(s)G(s)\)                                             |
| 15. \(\sin(\omega t) + \omega t \cos(\omega t)\) | \(\frac{2\omega s^2}{(s^2 + \omega^2)^2}\) | 30. \(\delta(t-c)\)                        | \(e^{-cs}\)                                             |
| 16. \(e^{at} \sin(\omega t)\)       | \(\frac{\omega}{(s-a)^2 + \omega^2}\)          | 31. \(f(t+T)\)                            | \(\frac{\int_0^T e^{-st} f(t) dt}{1-e^{-sT}}\)         |
| 17. \(e^{at} \cos(\omega t)\)       | \(\frac{s-a}{(s-a)^2 + \omega^2}\)             | 32. \(\int_0^t f(\sigma) d\sigma\)        | \(\frac{F(s)}{s}\)                                      |
| 18. \(t \sin(\omega t)\)            | \(\frac{2\omega s}{(s^2 + \omega^2)^2}\)       | 33. \(\frac{f(t)}{t}\)                    | \(\int_s^{\infty} F(\sigma) d\sigma\)                   |
| 19. \(t \cos(\omega t)\)            | \(\frac{s^2 - \omega^2}{(s^2 + \omega^2)^2}\)  | 34. \(f(at)\)                             | \(\frac{1}{a} F\left( \frac{s}{a} \right)\)             |

### Teoremas do Valor Inicial e Final:

$$ \lim_{s \to \infty} s F(s) = f(0) $$

$$ \lim_{s \to 0^+} s F(s) = \lim_{t \to \infty} f(t) $$
