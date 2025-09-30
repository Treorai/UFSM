clear all; close all;

% Definições de parâmetros
mu = 255;                % Parâmetro de compressão (mu-law)
td = 0.002;              % Intervalo entre pontos do sinal "analógico"
t = td:td:1;             % 1 segundo de duração
amp = 1;                 % Amplitude de referência
ts = 0.02;               % Taxa de amostragem: 50 Hz

% Sinal senoidal 3hz
xsig = sin(2*pi*3*t);

% Variando a faixa dinâmica do sinal
faixa_dinamica_dB = 20:80;  % Faixa dinâmica de 20dB a 80dB
SQNR_vec = zeros(size(faixa_dinamica_dB));

for i = 1:length(faixa_dinamica_dB)
    % Escalando o sinal de acordo com a faixa dinâmica
    sig_scaled = xsig * 10^(faixa_dinamica_dB(i)/20);
    
    % Quantização com a lei A
    quantizado = quantizacao_mu(sig_scaled, mu);
    
    % Desquantização
    desquantizado = desquantizacao_mu(quantizado, mu);
    
    % Cálculo do erro de quantização
    erro = sig_scaled - desquantizado;
    SQNR_vec(i) = 20 * log10(norm(sig_scaled) / norm(erro));  % SQNR
end

% Gráfico da SQNR em função da faixa dinâmica
figure;
plot(faixa_dinamica_dB, SQNR_vec, 'bo-', 'LineWidth', 2);
xlabel('Faixa Dinâmica (dB)');
ylabel('SQNR (dB)');
title('SQNR em função da Faixa Dinâmica para Quantização Não-Linear');
grid on;

% Função para quantização usando a lei A
function y = quantizacao_mu(x, mu)
    % Compressão (q)
    y = sign(x) .* log(1 + mu * abs(x)) / log(1 + mu);
end

% Função para desquantização usando a lei A
function x = desquantizacao_mu(y, mu)
    % Descompressão (dq)
    x = sign(y) .* ( (1 + mu) .^ abs(y) - 1 ) / mu;
end
