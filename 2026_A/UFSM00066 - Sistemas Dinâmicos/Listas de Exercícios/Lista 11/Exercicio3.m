pkg load control
clc;
clear;
close all;

% G(s) = 100 / [s(s+3)(s+6)]

num = 100;
den = conv([1 0],conv([1 3],[1 6]));
G = tf(num,den);
disp('Funcao de transferencia')
G

T = feedback(G,1);
disp('Funcao de transferencia em malha fechada:')
T
t = 0:0.01:20;

%% RESPOSTA AO DEGRAU
u_step = ones(size(t));
y_step = lsim(T,u_step,t);
figure;
plot(t,u_step,'--','LineWidth',1.5);
hold on;
plot(t,y_step,'LineWidth',1.5);
grid on;
title('Resposta ao Degrau');
xlabel('Tempo (s)');
ylabel('Amplitude');
legend('Entrada','Saida');

%% RESPOSTA AO IMPULSO
figure;
impulse(T,t);
grid on;
title('Resposta ao Impulso');
[y_imp,t_imp] = impulse(T,t);

%% RESPOSTA A RAMPA
u_ramp = t;
y_ramp = lsim(T,u_ramp,t);
figure;
plot(t,u_ramp,'--','LineWidth',1.5);
hold on;
plot(t,y_ramp,'LineWidth',1.5);
grid on;
title('Resposta a Rampa');
xlabel('Tempo (s)');
ylabel('Amplitude');
legend('Entrada','Saida');

%% ERRO DEGRAU
e_step = u_step - y_step';
figure;
plot(t,e_step,'LineWidth',1.5);
grid on;
title('Erro - Entrada Degrau');
xlabel('Tempo (s)');
ylabel('Erro');

%% ERRO IMPULSO
e_imp = -y_imp;
figure;
plot(t_imp,e_imp,'LineWidth',1.5);
grid on;
title('Erro - Entrada Impulso');
xlabel('Tempo (s)');
ylabel('Erro');

%% ERRO RAMPA
e_ramp = u_ramp - y_ramp';
figure;
plot(t,e_ramp,'LineWidth',1.5);
grid on;
title('Erro - Entrada Rampa');
xlabel('Tempo (s)');
ylabel('Erro');

%% GRAFICO DE NYQUIST
figure;
nyquist(G);
grid on;
title('Diagrama de Nyquist');

%% =====================================================
%% CALCULOS ANALITICOS
%% =====================================================

disp('=======================================')
disp('CALCULO DAS CONSTANTES DE ERRO')
disp('=======================================')

Kp = dcgain(G);

Kv = dcgain(tf([1 0],1)*G);

Ka = dcgain(tf([1 0 0],1)*G);

disp(['Kp = ', num2str(Kp)])
disp(['Kv = ', num2str(Kv)])
disp(['Ka = ', num2str(Ka)])

%% Erros estacionarios

ess_degrau = 1/(1+Kp);
ess_rampa  = 1/Kv;

disp(' ')
disp('Erros em regime permanente:')
disp(['Degrau = ', num2str(ess_degrau)])
disp(['Rampa  = ', num2str(ess_rampa)])

%% Valores finais observados

disp(' ')
disp('Valores numericos simulados:')
disp(['Saida final degrau = ', num2str(y_step(end))])
disp(['Erro final degrau = ', num2str(e_step(end))])

disp(['Saida final rampa = ', num2str(y_ramp(end))])
disp(['Erro final rampa = ', num2str(e_ramp(end))])
