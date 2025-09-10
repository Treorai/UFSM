clear all; close all;

% par�metros de tempo e sinal
td = 0.002;              % intervalo entre pontos do sinal "anal�gico"
t = td:td:1;             % 1 segundo de dura��o
xsig = sin(2*pi*3*t);    % seno de 3 Hz
amp = 1;                 % amplitude de refer�ncia

ts = 0.02; % intervalo de amostragem (50 Hz)

% varia��o do n�mero de bits
bits_vec = 3:16;
SQNR_vec = zeros(size(bits_vec));

for k = 1:length(bits_vec)
    bits = bits_vec(k);
    n = 2^bits; % n�veis de quantiza��o

    % amostragem + quantiza��o
    [s_out, sq_out] = amostra_quant(xsig, td, ts, amp, n);

    % erro de quantiza��o
    sr = s_out - sq_out; 
    SQNR_vec(k) = 20*log10(norm(s_out)/norm(sr));
end

% ajuste linear SQNR = a*bits + b
p = polyfit(bits_vec, SQNR_vec, 1);
a = p(1); b = p(2);

% gr�fico
figure;
plot(bits_vec, SQNR_vec, 'ro', 'MarkerFaceColor','r');
hold on;
plot(bits_vec, polyval(p, bits_vec), 'b-','LineWidth',1.5);
xlabel('N�mero de bits');
ylabel('SQNR (dB)');
title('SQNR em fun��o do n�mero de bits');
grid on;
legend('Simula��o','Ajuste linear');

% sa�da dos par�metros
fprintf('Reta ajustada: SQNR ? %.3f*bits + %.3f dB\n', a, b);


bits_vec = 3:16;
SQNR_hat = b + a*bits_vec;          % SQNR(bits) = b + a*bits

T = table(bits_vec.', SQNR_hat.', ...
          'VariableNames', {'bits','SQNR_dB_pred'});
disp(T)

