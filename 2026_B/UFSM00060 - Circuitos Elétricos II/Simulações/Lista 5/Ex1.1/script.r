clear all
close all
format short eng
clc

% Configuracao da Simulacao
f=100;
T=1/100;

Stop= 10*T;
Start= 6*T; %sem transitorio
Step= T/10000;

t1 = 22.488251e-3;
t2 = 28.493473e-3;
DT = t2-t1;

w= 2*pi*f;
Theta= w*DT* 180/pi

c = 360-Theta
