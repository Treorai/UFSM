clear all;close all;clc;

% Exemplo de analise de sinais amostrados
td=1/512; % intervalo entre os pontos do sinal "analogico"
t=td:td:1; % intervalo de 1 segundo
%xsig=sin(2*pi*t)+sin(2*3*pi*t); % seno de 1Hz + 3Hz;
xsig=2*sin(2*30*pi*t)+2*sin(2*20*pi*t); % seno de 30Hz;
%xsig = square(2*pi*3*t); % onda quadrada
%xsig=rectpuls(t*3); % pulso quadrado
Lsig=length(xsig);

figure(1);
subplot(211); sfig1a=plot(t,xsig,'k');
set(sfig1a,'LineWidth',2);
xlabel('tempo,segundos');
%axis([0 1 -2 2]);
title('sinal {\it g} ({\it t})');

% calcula a transformada de Fourier
Lfft=2^ceil(log2(Lsig));
Fmax=1/(2*td); % Nyquist!
Faxis=linspace(-Fmax,Fmax,Lfft+1);
Xsig=fftshift(fft(xsig,Lfft)/Lfft);

subplot(212); sfig1b=stem(Faxis(1:Lfft),abs(Xsig));
set(sfig1b,'LineWidth',1);
xlabel('frequ�ncia (Hz)');
axis([-50 50 0 2]);
title('Espectro de {\it g} ({\it t})');
