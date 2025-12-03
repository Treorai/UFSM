clear all;close all;clc;

% Exemplo de amostragem e quantiza??o
td=0.02; % intervalo entre os pontos do sinal "anal?gico"
t=td:td:1; % intervalo de 1 segundo
%xsig = sin(2*pi*10*t);	% senoide 10 Hz
%xsig(t > 0.5) = 0;    	% dura só até 0.5s, depois zera

[xsig, Fs_audio] = audioread('./assets/and-2.wav'); % carregar arquivo de áudio
xsig = xsig(:,1)'; % pega apenas 1 canal (mono)
Lsig = length(xsig);
t = (0:Lsig-1)/Fs_audio; % vetor de tempo baseado na taxa original
td = 1/Fs_audio; % intervalo de amostragem "analógico"




Lsig=length(xsig);

ts=0.3; % taxa de amostragem 50 Hz
fator=ts/td;
% envia o sinal a um amostrador
s_out = amostragem(xsig,td,ts);

% calcula a transformada de Fourier
Lfft=2^ceil(log2(Lsig)+1);
Fmax=1/(2*td);
Faxis=linspace(-Fmax,Fmax,Lfft);
Xsig=fftshift(fft(xsig,Lfft));
S_out=fftshift(fft(s_out,Lfft));

% tra?a gr?fico do sinal original e do sinal amostrado nos dom?nios do
% tempo e da frequencia

figure(1);
subplot(311); sfig1a=plot(t,xsig,'k');
hold on; sfig1b=plot(t,s_out(1:Lsig),'b'); hold off;
set(sfig1a,'LineWidth',2); set(sfig1b,'LineWidth',2);
xlabel('tempo,segundos');
title('sinal {\it g} ({\it t}) e suas amostras uniformes');

subplot(312); sfig1c=plot(Faxis,abs(Xsig));
xlabel('frequ?ncia (Hz)');
axis([-150 150 0 300]);
set(sfig1c,'LineWidth',1);
title('Espectro de {\it g} ({\it t})');

subplot(313); sfig1d=plot(Faxis,abs(S_out));
xlabel('frequ?ncia (Hz)');
axis([-150 150 0 300/fator]);
set(sfig1c,'LineWidth',1);
title('Espectro de {\it g}_T ({\it t})');

% calcula o sinal reconstru?do a partir de amostragem ideal
% e LPF (filtro passa-baixas) ideal
% M?xima largura do LPF ? igual a BW=floor((Lfft/Nfactor)/2);
BW=10; % largura de banda n?o ? maior que 10Hz
H_lpf=zeros(1,Lfft);H_lpf(Lfft/2 - BW:Lfft/2+BW-1)=1; % LPF ideal
S_recv=fator*S_out.*H_lpf; % filtragem ideal
s_recv=real(ifft(fftshift(S_recv))); % dom?nio da freq. reconstru?do
s_recv=s_recv(1:Lsig); % dom?nio do tempo reconstru?do


% tra?a gr?fico do sinal reconstru?do idealmente nos dom?nios do
% tempo e da frequencia
figure(2);
subplot(211); sfig2a=plot(Faxis,abs(S_recv));
xlabel('frequ?ncia (Hz)');
axis([-150 150 0 5]);
title('Espectro de filtragem ideal (reconstrucao)');
subplot(212); sfig2b=plot(t,xsig,'k-.',t,s_recv(1:Lsig),'b');
legend('Sinal original','Sinal reconstruido');
xlabel('tempo,segundos');
title('Sinal original versus Sinal reconstruido idealmente');
set(sfig2b,'LineWidth',2);
