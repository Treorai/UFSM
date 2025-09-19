clear all; close all;

% Defini��es de par�metros
mu = 255;                % Par�metro de compress�o (mu-law)
td = 0.002;              % Intervalo entre pontos do sinal "anal�gico"
t = td:td:1;             % 1 segundo de dura��o
amp = 1;                 % Amplitude de refer�ncia
ts = 0.02;               % Taxa de amostragem: 50 Hz

% Sinal senoidal 3hz
xsig = sin(2*pi*3*t);

% Variando a faixa din�mica do sinal
faixa_dinamica_dB = 20:80;  % Faixa din�mica de 20dB a 80dB
SQNR_vec = zeros(size(faixa_dinamica_dB));

for i = 1:length(faixa_dinamica_dB)
    % Escalando o sinal de acordo com a faixa din�mica
    sig_scaled = xsig * 10^(faixa_dinamica_dB(i)/20);
    
    % Quantiza��o com a lei A
    quantizado = quantizacao_mu(sig_scaled, mu);
    
    % Desquantiza��o
    desquantizado = desquantizacao_mu(quantizado, mu);
    
    % C�lculo do erro de quantiza��o
    erro = sig_scaled - desquantizado;
    SQNR_vec(i) = 20 * log10(norm(sig_scaled) / norm(erro));  % SQNR
end

% Gr�fico da SQNR em fun��o da faixa din�mica
figure;
plot(faixa_dinamica_dB, SQNR_vec, 'bo-', 'LineWidth', 2);
xlabel('Faixa Din�mica (dB)');
ylabel('SQNR (dB)');
title('SQNR em fun��o da Faixa Din�mica para Quantiza��o N�o-Linear');
grid on;

% Fun��o para quantiza��o usando a lei A
function y = quantizacao_mu(x, mu)
    % Compress�o (q)
    y = sign(x) .* log(1 + mu * abs(x)) / log(1 + mu);
end

% Fun��o para desquantiza��o usando a lei A
function x = desquantizacao_mu(y, mu)
    % Descompress�o (dq)
    x = sign(y) .* ( (1 + mu) .^ abs(y) - 1 ) / mu;
end
