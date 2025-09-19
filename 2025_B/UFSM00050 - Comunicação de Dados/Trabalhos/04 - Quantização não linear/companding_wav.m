clear all; close all; clc;

[y, Fs] = audioread('./assets/StarWars3.wav');

y = double(y);
y = y / max(abs(y));   % normalizar para [-1,1]

mu = 255;              % parâmetro
Nbits = 8;             % número de bits
L = 2^Nbits;           % níveis de quantização

faixa_dinamica_dB = 20:2:80;
SQNR_vec = zeros(size(faixa_dinamica_dB));

for i = 1:length(faixa_dinamica_dB)
    % Escalar o sinal para simular faixa dinâmica
    y_scaled = y * 10^(faixa_dinamica_dB(i)/20);

    % Compressão
    y_mu = sign(y_scaled) .* log(1 + mu*abs(y_scaled)) / log(1 + mu);

    % Quantização uniforme no domínio comprimido
    Delta = 2/L;
    qindex = floor((y_mu + 1)/Delta);
    qindex = min(qindex, L-1);
    yq_mu = -1 + Delta/2 + qindex*Delta;

    % Expansão (descompressão)
    y_rec = sign(yq_mu) .* ( (1+mu).^abs(yq_mu) - 1 ) / mu;

    % Calcular SQNR
    erro = y_scaled - y_rec;
    SQNR_vec(i) = 20*log10(norm(y_scaled)/norm(erro));
end

% Gráfico SQNR pela Faixa Dinâmica
figure;
plot(faixa_dinamica_dB, SQNR_vec, 'bo-','LineWidth',2);
xlabel('Faixa Dinâmica (dB)');
ylabel('SQNR (dB)');
title('SQNR em função da Faixa Dinâmica');
grid on;
