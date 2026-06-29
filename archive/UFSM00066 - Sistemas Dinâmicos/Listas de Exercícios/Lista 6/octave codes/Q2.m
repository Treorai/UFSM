pkg load control
clear; clc; close all;

s = tf('s');
G = (2*s)/(s+2);

t = 0:0.001:5;

figure;
step(G, t)
title('Resposta ao degrau - G(s)=2s/(s+2)')
grid on
