pkg load control

clc
clear
close all

% Função de transferência
num = [4];
den = [20 32 13 1];

G = tf(num, den);

% Mostrar função
disp('Funcao de transferencia G(s):')
G

% Plot do diagrama de Bode
figure
bode(G)
grid on
title('Diagrama de Bode')

% Margens de ganho e fase
figure
margin(G)
grid on
title('Margens de Ganho e Fase')

% -----------------------------
% Estabilidade em malha fechada
% -----------------------------

% Sistema em malha fechada
T = feedback(G, 1);

disp('Funcao de transferencia em malha fechada:')
T

% Polos da malha fechada
p = pole(T);

disp('Polos da malha fechada:')
disp(p)

% Verificacao de estabilidade
if all(real(p) < 0)
    disp('Sistema ESTAVEL em malha fechada')
else
    disp('Sistema INSTAVEL em malha fechada')
end
