# Exercícios Transformada de Laplace

## 1. Calcule $\mathcal{L} \{ f(t) \}$ onde

a) $f(t) = \begin{cases} 
\sin(t), & 0 \leq t \leq \pi \\
0, & t \geq \pi
\end{cases}$

b) $f(t) = \begin{cases} 
0, & 0 \leq t \leq \frac{\pi}{2} \\
\cos(t), & t \geq \frac{\pi}{2}
\end{cases}$

$$f(t)=u(t- \frac{\pi}{2} cos(t)$$

onde $u(t-a)$ é a func degrau

$$cos(t)=cos((t-\frac{\pi}{2})+\frac{\pi}{2}$$




c) $f(t) = e^{-t} \sin(t)$

d) $f(t) = e^{3t^2}$

e) $f(t) = t^2 + 6t - 3$

f) $f(t) = (t + 1)^3$

g) $f(t) = (e^{-t} - e^{-t})^2$

h) $f(t) = \sin(2t) \cos(2t)$

i) $f(t) = \sin^3(t)$

j) $f(t) = t^{-\frac{1}{2}}$

k) $f(t) = t^{\frac{3}{2}}$

## 2. Calcule \( f(t) \) onde

a) $\mathcal{L}^{-1} \left\{ \left( \frac{2}{s - 1 + s^3} \right)^2 \right\}$

b) $\mathcal{L}^{-1} \left\{ \frac{(s + 1)^3}{s^4} \right\}$

c) $\mathcal{L}^{-1} \left\{ \frac{4}{s^2 + 6s + 5} \cdot \frac{1}{s + 8} \right\}$

d) $\mathcal{L}^{-1} \left\{ \frac{10s}{s^2 + 16} \right\}$

e) $\mathcal{L}^{-1} \left\{ \frac{s}{s^2 + 2s - 3} \right\}$

f) $\mathcal{L}^{-1} \left\{ \frac{1}{s^2 + 8s - 20} \right\}$

g) $\mathcal{L}^{-1} \left\{ \frac{1}{(s - \sqrt{3})(s + \sqrt{3})} \right\}$

h) $\mathcal{L}^{-1} \left\{ \frac{2s + 4}{(s - 2)(s^2 + 4s + 3)} \right\}$

i) $\mathcal{L}^{-1} \left\{ \frac{s + 1}{(s^2 - 4s)(s + 5)} \right\}$

j) $\mathcal{L}^{-1} \left\{ \frac{s - 1}{s^2(s^2 + 1)} \right\}$

l) $\mathcal{L}^{-1} \left\{ \frac{1}{(s + 1)(s^2 + 4)} \right\}$

## 3. Encontre \( F(s) \) ou \( f(t) \) como indicado.

a) $f(t) = \begin{cases} 2, & 0 \leq t < 3 \\ -2, & t \geq 3 \end{cases}$

b) $\mathcal{L}\{ e^{10t} \}$

c) $\mathcal{L}\{ e^{-2t} \cos(4t) \}$

d) $\mathcal{L}\{ t(e^t + e^{2t}) \}$

e) $\mathcal{L}\{ e^{2t}(t - 1)^2 \}$

f) $\mathcal{L}\{ \cos(3t) \}$

g) $\mathcal{L}\left\{ \frac{1}{(s - 1)^4} \right\}$

h) $\mathcal{L}\left\{ \frac{s}{s^2 + 4s + 5} \right\}$

i) $\mathcal{L}\left\{ \frac{(s + 1)^2}{(s + 2)^4} \right\}$

j) $\mathcal{L}\left\{ e^{-2t} u(t - 2) \right\}$

k) $\mathcal{L}\left\{ \cos(2t)u(t - \pi) \right\}$

l) $\mathcal{L}\left\{ (t - 1)^3 e^{-t} u(t - 1) \right\}$

m) $\mathcal{L}\left\{ t e^{t} u(t - 5) \right\}$

n) $\mathcal{L}\left\{ e^{-t} \sin(5t) \right\}$

o) $\mathcal{L}\left\{ \sec\left( \frac{\pi t}{2} \right) \right\}$

p) $\mathcal{L}\left\{ e^{-2s} \right\}$

q) $\mathcal{L}\left\{ e^{2t} \sin(6t) \right\}$

r) $\mathcal{L}^{-1} \left\{ \frac{s + 1}{(s^2 + 2s + 2)^2} \right\}$

## 4. Escreva cada função em termos de funções degrau unitário e em seguida encontre a transformada de Laplace da função dada.

a) $f(t) = \begin{cases} 
2, & 0 \leq t < 3 \\
-2, & t \geq 3
\end{cases}$

b) $f(t) = \begin{cases} 
0, & 0 \leq t < \frac{3\pi}{2} \\
\sin(t), & t \geq \frac{3\pi}{2}
\end{cases}$

## 5. Sabendo que $f(t) = -\frac{1}{l} \mathcal{L}^{-1} \left( \frac{d}{ds} F(s) \right)$, calcule:

a) $\mathcal{L}^{-1} \left\{ \frac{n s - 3}{s + 1} \right\}$

b) $\mathcal{L}^{-1} \left\{ \frac{s^2 + 1}{s^2 + 4} \right\}$

## 6. Encontre a transformada de Laplace da função dada sem resolver a integral.

a) $\mathcal{L} \left\{ \int_0^t e^t dt \right\}$

b) $\mathcal{L} \left\{ \int_0^t e^{\tau} \cos(\tau) d\tau \right\}$

c) $\mathcal{L} \left\{ \int_0^t r \sin(r) dr \right\}$

d) $\mathcal{L} \left\{ \int_0^t t e^t dt \right\}$

e) $\mathcal{L} \left\{ \int_0^t t^4 dt \right\}$

f) $\mathcal{L} \left\{ \int_0^t e^{2t} \sin(t) dt \right\} $

## 7. Sabendo que \( \mathcal{L}^{-1} F(s) G(s) = f * g \), calcule

a) $$ \mathcal{L}^{-1} \left\{ \frac{1}{s(s + 1)} \right\} $$

b) $$ \mathcal{L}^{-1} \left\{ \frac{1}{(s + 1)(s - 2)} \right\} $$

c) $$ \mathcal{L}^{-1} \left\{ \frac{s}{(s^2 + 4)^2} \right\} $$

## 8. Use a transformada de Laplace para resolver a equação diferencial dada sujeita às condições iniciais indicadas. Quando apropriado, escreva \( f \) em termos de funções degrau unitário.

a) \( y'' + 4y = e^{-4t}, \, y(0) = 2 \)

b) \( y'' + 5y' + 4y = 0, \, y(0) = 1, y'(0) = 0 \)

c) \( y'' - 4y' + 4y = t^3 e^{2t}, \, y(0) = 0, y'(0) = 0 \)

d) \( y'' - y' = e^t \cos(t), \, y(0) = 0, y'(0) = 0 \)

e) \( y'' + 4y = \sin(t) u(t - 2\pi), \, y(0) = 1, y'(0) = 0 \)

## 9. Use a transformada de Laplace para resolver a equação integral dada ou a equação integro-diferencial.

a) \( f(t) + \int_0^t (t - \tau) f(\tau) d\tau = t \)

b) \( f(t) = 2t - A \int_0^t \sin(\tau) f(t - \tau) d\tau \)

c) \( y'(t) = 1 - \sin(t) - \int_0^t y(\tau) d\tau, \, y(0) = 0 \)

## 10. Use a transformada de Laplace para resolver a equação diferencial dada sujeita às condições iniciais indicadas.

a) \( y'' - 3y = \delta(t - 2), \, y(0) = 0 \)

b) \( y'' + y = \delta(t - 2\pi), \, y(0) = 0, y'(0) = 0 \)
