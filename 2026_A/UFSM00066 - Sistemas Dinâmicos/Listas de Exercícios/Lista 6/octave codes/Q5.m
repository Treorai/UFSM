pkg load control
clear; clc; close all;

s = tf('s');

G1 = 1/(s-1);
G2 = (s+2)/(s+1);
G3 = 1/((s+1)*(s+2));
G4 = 1/((s+1)*(s-2));
G5 = 1/((s+1)^2 + 1); % corrigido
G6 = 1/(s^2+1);
G7 = 1/(s^2-1);

t = 0:0.001:10;

figure;

subplot(4,2,1); step(G1,t); title('G1'); grid on
subplot(4,2,2); step(G2,t); title('G2'); grid on
subplot(4,2,3); step(G3,t); title('G3'); grid on
subplot(4,2,4); step(G4,t); title('G4'); grid on
subplot(4,2,5); step(G5,t); title('G5'); grid on
subplot(4,2,6); step(G6,t); title('G6'); grid on
subplot(4,2,7); step(G7,t); title('G7'); grid on
