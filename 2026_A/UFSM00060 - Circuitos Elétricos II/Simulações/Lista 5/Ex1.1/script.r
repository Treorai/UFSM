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
