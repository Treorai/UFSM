pkg load control
clear; clc; close all;

s = tf('s');
G = 1/(s+10);

t1 = 0:0.001:1;
t2 = 0:0.001:2;

% Calcula respostas
[y_imp, t_imp] = impulse(G, t1);
[y_step, t_step] = step(G, t1);

ramp = t2;
y_ramp = lsim(G, ramp, t2);

figure;

subplot(3,1,1)
plot(t_imp, y_imp)
title('Resposta ao impulso - G(s)=1/(s+10)')
grid on

subplot(3,1,2)
plot(t_step, y_step)
title('Resposta ao degrau')
grid on

subplot(3,1,3)
plot(t2, y_ramp)
title('Resposta à rampa')
grid on
