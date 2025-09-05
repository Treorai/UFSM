clear all; close all;

% parâmetros de tempo e sinal
td = 0.002;              % intervalo entre pontos do sinal "analógico"
t = td:td:1;             % 1 segundo de duração
xsig = sin(2*pi*3*t);    % seno de 3 Hz
amp = 1;                 % amplitude de referência

ts = 0.02; % intervalo de amostragem (50 Hz)

% variação do número de bits
bits_vec = 3:16;
SQNR_vec = zeros(size(bits_vec));

for k = 1:length(bits_vec)
    bits = bits_vec(k);
    n = 2^bits; % níveis de quantização

    % amostragem + quantização
    [s_out, sq_out] = amostra_quant(xsig, td, ts, amp, n);

    % erro de quantização
    sr = s_out - sq_out; 
    SQNR_vec(k) = 20*log10(norm(s_out)/norm(sr));
end

% ajuste linear SQNR = a*bits + b
p = polyfit(bits_vec, SQNR_vec, 1);
a = p(1); b = p(2);

% gráfico
figure;
plot(bits_vec, SQNR_vec, 'ro', 'MarkerFaceColor','r');
hold on;
plot(bits_vec, polyval(p, bits_vec), 'b-','LineWidth',1.5);
xlabel('Número de bits');
ylabel('SQNR (dB)');
title('SQNR em função do número de bits');
grid on;
legend('Simulação','Ajuste linear');

% saída dos parâmetros
fprintf('Reta ajustada: SQNR ? %.3f*bits + %.3f dB\n', a, b);


bits_vec = 3:16;
SQNR_hat = b + a*bits_vec;          % SQNR(bits) = b + a*bits

T = table(bits_vec.', SQNR_hat.', ...
          'VariableNames', {'bits','SQNR_dB_pred'});
disp(T)

