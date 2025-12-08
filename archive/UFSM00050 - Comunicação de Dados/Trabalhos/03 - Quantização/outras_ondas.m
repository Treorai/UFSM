clear all; close all;

td = 0.002;              
t = td:td:1;             
amp = 1;                 
ts = 0.02;              

bits_vec = 3:16;

% ==== Definição dos sinais ====
xsig1 = sin(2*pi*3*t);                           % senoide
xsig2 = square(2*pi*3*t);                        % quadrada
xsig3 = sawtooth(2*pi*3*t, 0.5);                 % triangular
xsig4 = sin(2*pi*3*t) + 0.5*sin(2*pi*7*t);       % composta

signals = {xsig1, xsig2, xsig3, xsig4};
labels  = {'Senoide','Quadrada','Triangular','Composta'};

figure;
for s = 1:length(signals)
    xsig = signals{s};
    SQNR_vec = zeros(size(bits_vec));

    for k = 1:length(bits_vec)
        bits = bits_vec(k);
        n = 2^bits;

        [s_out, sq_out] = amostra_quant(xsig, td, ts, amp, n);
        sr = s_out - sq_out;
        SQNR_vec(k) = 20*log10(norm(s_out)/norm(sr));
    end

    % ajuste linear
    p = polyfit(bits_vec, SQNR_vec, 1);
    a = p(1); b = p(2);

    % gráfico
    subplot(2,2,s)
    plot(bits_vec, SQNR_vec, 'ro','MarkerFaceColor','r'); hold on;
    plot(bits_vec, polyval(p,bits_vec),'b-','LineWidth',1.5);
    xlabel('Número de bits'); ylabel('SQNR (dB)');
    title([labels{s} ' — SQNR vs bits']);
    grid on;
    legend('Simulação','Ajuste linear');

    % imprimir equação da reta
    fprintf('\n%s: SQNR ? %.3f*bits + %.3f dB\n', labels{s}, a, b);

    % tabela bits vs SQNR previsto
    SQNR_hat = b + a*bits_vec;
    T = table(bits_vec.', SQNR_vec.', SQNR_hat.', ...
              'VariableNames', {'bits','SQNR_sim','SQNR_pred'});
    disp(T)
end
