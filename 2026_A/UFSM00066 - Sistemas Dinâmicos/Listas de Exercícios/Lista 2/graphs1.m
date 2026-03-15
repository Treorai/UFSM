clear all
clc
close all
pkg load control

t = 0:0.01:10;

%--------------------------
% SISTEMA A
% y' + 4y = r(t)
%--------------------------

numA = [1];
denA = [1 4];
sysA = tf(numA,denA);

y_impA = exp(-4*t);
y_stepA = (1/4)*(1-exp(-4*t));

impA = impulse(sysA,t);
stepA = step(sysA,t);

figure
subplot(2,1,1)
plot(t,impA,'r')
title('Sistema A - Impulso')
legend('Simulado')
grid on

subplot(2,1,2)
plot(t,stepA,'r')
title('Sistema A - Degrau')
legend('Simulado')
grid on


%--------------------------
% SISTEMA B
% y'' +5y' +4y = r(t)
%--------------------------

numB = [1];
denB = [1 5 4];
sysB = tf(numB,denB);

y_impB = (1/3)*(exp(-t)-exp(-4*t));
y_stepB = 1/4 - (1/3)*exp(-t) + (1/12)*exp(-4*t);

impB = impulse(sysB,t);
stepB = step(sysB,t);

figure
subplot(2,1,1)
plot(t,impB,'r')
title('Sistema B - Impulso')
legend('Simulado')
grid on

subplot(2,1,2)
plot(t,stepB,'r')
title('Sistema B - Degrau')
legend('Simulado')
grid on


%--------------------------
% SISTEMA C
% y'' -4y' +4y = r(t)
%--------------------------

numC = [1];
denC = [1 -4 4];
sysC = tf(numC,denC);

y_impC = t.*exp(2*t);
y_stepC = 1/4 - (1/4)*exp(2*t) + (1/2)*t.*exp(2*t);

impC = impulse(sysC,t);
stepC = step(sysC,t);

figure
subplot(2,1,1)
plot(t,impC,'r')
title('Sistema C - Impulso')
legend('Simulado')
grid on

subplot(2,1,2)
plot(t,stepC,'r')
title('Sistema C - Degrau')
legend('Simulado')
grid on


%--------------------------
% SISTEMA D
% y'' - y' = r(t)
%--------------------------

numD = [1];
denD = [1 -1 0];
sysD = tf(numD,denD);

y_impD = exp(t) - 1;
y_stepD = t + exp(t) - 1;

impD = impulse(sysD,t);
stepD = step(sysD,t);

figure
subplot(2,1,1)
plot(t,impD,'r')
title('Sistema D - Impulso')
legend('Simulado')
grid on

subplot(2,1,2)
plot(t,stepD,'r')
title('Sistema D - Degrau')
legend('Simulado')
grid on


%--------------------------
% SISTEMA E
% y'' +4y' = r(t)
%--------------------------

numE = [1];
denE = [1 4 0];
sysE = tf(numE,denE);

y_impE = (1/4)*(1-exp(-4*t));
y_stepE = (t/4) - (1/16)*(1-exp(-4*t));

impE = impulse(sysE,t);
stepE = step(sysE,t);

figure
subplot(2,1,1)
plot(t,impE,'r')
title('Sistema E - Impulso')
legend('Simulado')
grid on

subplot(2,1,2)
plot(t,stepE,'r')
title('Sistema E - Degrau')
legend('Simulado')
grid on
