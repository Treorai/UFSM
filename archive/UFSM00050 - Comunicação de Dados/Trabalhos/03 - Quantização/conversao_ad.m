clear all;close all;
%pkg load signal;

% Exemplo de amostragem e quantizacao 
td=0.002; % intervalo entre os pontos do sinal "analogico"
t=td:td:1; % intervalo de 1 segundo
xsig=sin(2*3*pi*t); % seno de 3Hz;
Lsig=length(xsig);

ts=0.02; % taxa de amostragem 50 Hz
fator=ts/td;

figure(1);
subplot(311); sfig1a=plot(t,xsig,'k');
set(sfig1a,'LineWidth',2); 
xlabel('tempo,segundos');
title('sinal');

amp = 1;     
%amp = max(xsig);
bits = 16;  % numero de bits da conversao analogico/digital
n=2^bits; % numero de niveis

% envia o sinal a um amostrador e quantizador
[s_out,sq_out] = amostra_quant(xsig,td,ts,amp,n);

subplot(312);
stem(t,s_out,'filled');
hold on;
stem(t,sq_out,'r', 'filled');

% ruido de quantizacao
sr = s_out - sq_out; % erro
emq = sr*sr'/length(sr); % erro medio quadratico
SQNR=20*log10(norm(s_out)/norm(sr)); % valor da SQNR

sfig1b = plot(t,sr,'k');
set(sfig1b,'LineWidth',2);
axis([0 1 -2 2]);
xlabel('tempo,segundos');
title('sinal {\it g} ({\it t}) e suas amostras uniformes e quantizadas');

% diferenca entre sinal e ruido
subplot(313);
sfig1c=plot(t,xsig);
hold on;
stem(t,sq_out,'r','filled');
set(sfig1c,'LineWidth',2);
axis([0 1 -2 2]);
xlabel('tempo,segundos');
title('sinal {\it g} ({\it t}) e suas amostras uniformes e quantizadas');



