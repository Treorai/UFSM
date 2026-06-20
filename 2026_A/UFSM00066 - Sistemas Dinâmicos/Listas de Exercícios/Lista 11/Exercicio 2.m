pkg load control

clc;
clear;
close all;

num = conv([1 7],[1 10]);      % (s+7)(s+10)
den = conv([1 0 0],[1 3]);     % s²(s+3)

G = tf(num,den);

T = feedback(G,1); %realimentação unitária

disp('Função de transferência em malha fechada:')
T

t = 0:0.01:20;

%% Resposta ao degrau
[y_step,t_step] = step(T,t);

figure;
plot(t_step,y_step,'LineWidth',1.5);
grid on;
title('Resposta ao Degrau');
xlabel('Tempo (s)');
ylabel('Saída');

%% Resposta ao impulso
[y_imp,t_imp] = impulse(T,t);

figure;
plot(t_imp,y_imp,'LineWidth',1.5);
grid on;
title('Resposta ao Impulso');
xlabel('Tempo (s)');
ylabel('Saída');

%% Resposta à rampa
u_ramp = t;
y_ramp = lsim(T,u_ramp,t);

figure;
plot(t,y_ramp,'LineWidth',1.5);
hold on;
plot(t,u_ramp,'--');
grid on;
title('Resposta à Rampa');
xlabel('Tempo (s)');
ylabel('Amplitude');
legend('Saída','Entrada');

%% Erro para degrau
e_step = 1 - y_step;

figure;
plot(t_step,e_step,'LineWidth',1.5);
grid on;
title('Erro para Entrada Degrau');
xlabel('Tempo (s)');
ylabel('Erro');

%% Erro para rampa
e_ramp = u_ramp - y_ramp';

figure;
plot(t,e_ramp,'LineWidth',1.5);
grid on;
title('Erro para Entrada Rampa');
xlabel('Tempo (s)');
ylabel('Erro');

%% Valores finais numéricos
disp('------------------------------------')
disp(['Saida final degrau = ', num2str(y_step(end))])
disp(['Erro final degrau  = ', num2str(e_step(end))])

disp(['Saida final rampa = ', num2str(y_ramp(end))])
disp(['Erro final rampa  = ', num2str(e_ramp(end))])

%% Constantes de erro
Kp = dcgain(G);

Kv = dcgain(tf([1 0],1)*G);

disp('------------------------------------')
disp(['Kp = ', num2str(Kp)])
disp(['Kv = ', num2str(Kv)])

ess_degrau = 1/(1+Kp);
ess_rampa  = 1/Kv;

disp(['Erro analitico degrau = ', num2str(ess_degrau)])
disp(['Erro analitico rampa  = ', num2str(ess_rampa)])
