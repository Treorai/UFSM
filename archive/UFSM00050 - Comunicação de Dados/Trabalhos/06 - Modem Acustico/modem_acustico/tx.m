clear all; clc;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
msg = "Comunica os Dados"; % mensagem (dados)
RB = 100; % taxa de bits (bps)
Fp = 2000; % frequencia da portadora (2kHz)
Fa = 8000; % frequencia ou taxa de amostragem (8k amostras/s)

OCTAVE = 1;

if OCTAVE == 1
  pkg load signal;
end

[ytx,bits] = transmissor(msg, RB, Fp, Fa);

%disp(['Tamanho do quadro: ' num2str(length(bits)) ' bits'])
%disp(['Tamanho do sinal: ' num2str(length(ytx)) ' amostras'])

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Transmissao do sinal usando a placa de som        %
if OCTAVE == 1
    soundsc(ytx,Fa);
else % MATLAB
    p = audioplayer(ytx, Fa);
    play(p);
end


% grafico do sinal transmitido
t = (0:length(ytx) - 1)/Fa;
stem(t,ytx);



