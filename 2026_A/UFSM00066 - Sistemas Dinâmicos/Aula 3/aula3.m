clear all,clc, close all

L=1; C=1; R=1;

num = 1/(L*C);
den = [1 R/L 1/(L*C)];

G1=tf(num, den)

impulse(G1)