# Cálculo Vetorial Diferencial

## Operador Nabla ($\vec\nabla$)

Em coordenadaas cartesianas:

$\displaystyle \vec\nabla=\frac{\partial â_x}{\partial x}+\frac{\partial â_y}{\partial y}+\frac{\partial â_z}{\partial z}$

- Em coordenadas cilíndricas:

$\displaystyle \vec\nabla=\frac{\partial â_\rho}{}+\frac{\partial â_\phi}{}+\frac{\partial â_z}{}$

- Em coordenadas cilíndricas:

- Em coordenadas esféricas:

## Divergente de um Campo Vetorial

O divergente de um campo ventorial $\vec A$ é um campo escalar.

- Em coordenadas cartesianas:

$\displaystyle \vec \nabla \cdot \vec A = \frac{\partial}{\partial x}A_x + \frac{\partial}{\partial y} A_y + \frac{\partial}{\partial z} A_z$

- Em coordenadas cilíndricas:

$\displaystyle \vec \nabla \cdot \vec A = \frac{1}{\rho} \cdot \frac{\partial}{\partial \rho} (\rho\cdot A_\rho)+ \frac{1}{\rho} \frac{\partial}{\partial\phi} A_\phi + \frac{\partial}{\partial z} A_z$

- Em coordenadas esféricas:

$\displaystyle \vec \nabla \cdot \vec A = \frac{1}{r}\cdot \frac{\partial}{\partial r} (r^2 \cdot A_r) + \frac{1}{r\cdot \sin\theta} \cdot \frac{\partial}{\partial \theta} (A_\theta \cdot \sin\theta) + \frac{1}{r \cdot \sin \theta} \cdot \frac{\partial}{\partial \phi} A_\phi$

### Exemplo

Seja $\displaystyle \vec A = x^2 \cdot â_x$, calcule $\displaystyle \vec \nabla \cdot A$

$\displaystyle \vec \nabla \cdot \vec A = \frac{\partial}{\partial x} (x^2) + \frac{\partial}{\partial y} (0) + \frac{\partial}{\partial z} (0)$

$\displaystyle \vec \nabla \cdot \vec A = 2x$

### Exemplo

Seja $\displaystyle \vec A = y^2 \cdot â_x$, calcule $\displaystyle \vec \nabla \cdot \vec A$

$\displaystyle \vec \nabla \cdot \vec A = \frac{\partial}{\partial x} (y^2) + \frac{\partial}{\partial y} (0) + \frac{\partial}{\partial z} (0)$

$\displaystyle \vec \nabla \cdot \vec A = 0$

## Rotacional de um Campo Vetorial

O rotacional de um campo vetorial $\vec A$ é outro campo vetorial.

- Em coordenadas cartesianas:

$\displaystyle \vec \nabla \cdot \vec A = 
\begin{vmatrix}
  â_x & â_y & â_z \\
  \frac{\partial}{\partial x} & \frac{\partial}{\partial y} & \frac{\partial}{\partial z} \\
  A_x & A_y & A_z \\
  \end{vmatrix}$

- Em coordenadas cilíndricas:

$\displaystyle \vec \nabla \cdot \vec A = 
\begin{vmatrix}
  â_\rho & â_\phi & â_z \\
  \frac{\partial}{\partial \rho} & \frac{\partial}{\partial \phi} & \frac{\partial}{\partial z} \\
  A_\rho & A_\phi & A_z \\
  \end{vmatrix}$

- Em coordenadas esféricas:

$\vec \nabla \cdot \vec A = 
\begin{vmatrix}
  â_r & â_\theta & â_\phi \\
  \frac{\partial}{\partial r} & \frac{\partial}{\partial \theta} & \frac{\partial}{\partial \phi} \\
  A_r & A_\theta & A_\phi \\
  \end{vmatrix}$

### Exemplo

Seja $\displaystyle \vec A = y^2 \cdot â_x$, calcule $\vec \nabla \times \vec A$

$\displaystyle \vec \nabla \times \vec A = 
\begin{vmatrix}
  â_x & â_y & â_z \\
  \frac{\partial}{\partial x} & \frac{\partial}{\partial y} & \frac{\partial}{\partial z} \\
  y^2 & 0 & 0 \\
  \end{vmatrix}$

$\displaystyle \vec \nabla \times \vec A = \frac{\partial}{\partial z} (y^2) \cdot â_y - \frac{\partial}{\partial y} (y^2) \cdot â_z$

$\displaystyle \vec \nabla \times \vec A = (-2y) â_z$

$\displaystyle \vec \nabla \times \vec A = (2y) -â_z$

## Laplaciano de um Campo Escalar

O laplaciano de um campo escalar é outro campo escalar, e é o diverggente do gradiente deste campo ( $\displaystyle \nabla^2 \cdot V=\vec \nabla \cdot \vec \nabla V$ )

- Em coordenadas cartesianas:

$\displaystyle \nabla^2 \cdot V = \frac{\partial^2}{\partial x^2} V + \frac{\partial^2}{\partial y~2} V + \frac{\partial^2}{\partial z^2} V$

- Em coordenadas cilíndricas:

$\displaystyle \nabla^2 \cdot V = \frac{1}{\rho} \cdot \frac{\partial}{\partial \rho} \cdot \left (\rho \cdot \frac{\partial V}{\partial \rho} \right) + \frac{1}{\rho^2} \cdot \frac{\partial^2 V}{\partial \phi^2} + \frac{\partial^2 V}{\partial z^2}$

- Em coordenadas esféricas:

$\displaystyle \nabla^2 \cdot V = \frac{1}{r^2} \cdot \frac{\partial}{\partial r} \cdot \left (r^2 \cdot \frac{\partial V}{\partial r} \right) + \frac{1}{r^2 \cdot\sin(\theta)} \cdot \frac{\partial}{\partial }
