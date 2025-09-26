clear all; close all; clc;

%% Parâmetros
Ts = 16;             % samples por símbolo
Nb = 20000;          % número de bits (grande para estimativa PSD)
B  = rand(1,Nb) > 0.5;  % bits aleatórios
pulso = ones(1,Ts);  % pulso retangular NRZ

%% --- Funções auxiliares (inline) ---
% Converte sequência de símbolos (-1,0,1) para sinal amostrado usando pulso
shape = @(symb) kron(symb, pulso);

%% --- Gera AMI (Alternate Mark Inversion) ---
AMI_sym = zeros(1,Nb);
last = -1;
for k=1:Nb
    if B(k)==1
        last = -last;        % alterna polaridade a cada '1'
        AMI_sym(k) = last;
    else
        AMI_sym(k) = 0;
    end
end
AMI = shape(AMI_sym);

%% --- Gera Pseudoternária (zeros -> +/- , ones -> 0) ---
PSEUD_sym = zeros(1,Nb);
alt = 1;
for k=1:Nb
    if B(k)==0
        PSEUD_sym(k) = alt;
        alt = -alt;
    else
        PSEUD_sym(k) = 0;
    end
end
PSEUD = shape(PSEUD_sym);

%% --- Gera B8ZS (substitui 8 zeros por 000VB0VB) ---
% trabalha sobre bits e produz símbolos AMI-modificados
B8ZS_sym = []; 
last = -1; % polaridade do ultimo pulso transmitido (assuma -1 inicialmente)
k = 1;
while k <= Nb
    if k+7 <= Nb && all(B(k:k+7)==0)   % encontro de 8 zeros
        % V = violação = mesma polaridade do último pulso não-zero
        if last == 0, V = 1; else V = last; end
        Bp = -V; % B = bipolar pulse com polaridade oposta ao V
        % padrão 000 V B 0 V B
        block = [0 0 0 V Bp 0 V Bp];
        B8ZS_sym = [B8ZS_sym block];
        last = Bp;           % última polaridade transmitida após substituição
        k = k + 8;
    else
        if B(k)==1
            last = -last;
            B8ZS_sym = [B8ZS_sym last];
        else
            B8ZS_sym = [B8ZS_sym 0];
        end
        k = k + 1;
    end
end
B8ZS = shape(B8ZS_sym);

%% --- Gera HDB3 (substitui 4 zeros por 000V ou B00V conforme paridade) ---
HDB3_sym = [];
last = -1;            % polaridade do último pulso não-zero (assuma -1)
count_nonzero = 0;    % número de pulsos (+/-) desde a última substituição
k = 1;
while k <= Nb
    if k+3 <= Nb && all(B(k:k+3)==0)  % encontro de 4 zeros
        if mod(count_nonzero,2) == 0
            % usar 000V : V tem mesma polaridade que last
            if last==0, V = 1; else V = last; end
            block = [0 0 0 V];
            % atualiza contagem: apenas V é não-zero
            count_nonzero = count_nonzero + 1;
            last = V;
        else
            % usar B00V : B e V têm polaridade oposta ao last
            Bp = -last;
            V = Bp;    % B e V mesma polaridade
            block = [Bp 0 0 V];
            % atualiza contagem: Bp e V são dois pulsos -> +2
            count_nonzero = count_nonzero + 2;
            last = V;
        end
        HDB3_sym = [HDB3_sym block];
        k = k + 4;
    else
        if B(k)==1
            last = -last;
            HDB3_sym = [HDB3_sym last];
            count_nonzero = count_nonzero + 1;
        else
            HDB3_sym = [HDB3_sym 0];
        end
        k = k + 1;
    end
end
HDB3 = shape(HDB3_sym);

%% --- Ajuste AMI/Pseudoternária originais gerados acima (já OK) ---

%% --- Para comparação: padronizar comprimentos (usar mínimo) ---
L = min([length(AMI), length(PSEUD), length(B8ZS), length(HDB3)]);
AMI = AMI(1:L);
PSEUD = PSEUD(1:L);
B8ZS = B8ZS(1:L);
HDB3 = HDB3(1:L);

%% --- Estimativa de PSD (Welch) ---
Fs = Ts;                    % frequência de amostragem arbitrária (samples/símbolo)
nfft = 4096;
window = 1024;
noverlap = 512;

[Px_AMI, f]   = pwelch(AMI,  window, noverlap, nfft, Fs);
[Px_PSEUD, ~] = pwelch(PSEUD,window, noverlap, nfft, Fs);
[Px_B8ZS, ~]  = pwelch(B8ZS, window, noverlap, nfft, Fs);
[Px_HDB3, ~]  = pwelch(HDB3, window, noverlap, nfft, Fs);

%% --- Plots PSD (linear e dB) ---
figure('Position',[100 100 900 600]);
subplot(2,1,1);
plot(f, Px_AMI, 'r','LineWidth',1.2); hold on;
plot(f, Px_PSEUD, 'b','LineWidth',1.2);
plot(f, Px_B8ZS, 'g','LineWidth',1.2);
plot(f, Px_HDB3, 'm','LineWidth',1.2);
legend('AMI','Pseudoternária','B8ZS','HDB3');
xlabel('Frequência (Hz)'); ylabel('PSD (linear)');
title('PSDs (Welch) - linear');
grid on;

subplot(2,1,2);
plot(f, 10*log10(Px_AMI+eps), 'r','LineWidth',1.2); hold on;
plot(f, 10*log10(Px_PSEUD+eps),'b','LineWidth',1.2);
plot(f, 10*log10(Px_B8ZS+eps), 'g','LineWidth',1.2);
plot(f, 10*log10(Px_HDB3+eps), 'm','LineWidth',1.2);
legend('AMI','Pseudoternária','B8ZS','HDB3');
xlabel('Frequência (Hz)'); ylabel('PSD (dB/Hz)');
title('PSDs (Welch) - dB');
grid on;

%% --- PSDs sem componente DC (removendo média) para comparar forma espectral ---
x_AMI_z  = AMI  - mean(AMI);
x_PSE_z  = PSEUD- mean(PSEUD);
x_B8ZS_z = B8ZS - mean(B8ZS);
x_HDB3_z = HDB3 - mean(HDB3);

[PxA_z, ~] = pwelch(x_AMI_z,  window, noverlap, nfft, Fs);
[PxP_z, ~] = pwelch(x_PSE_z,  window, noverlap, nfft, Fs);
[PxB_z, ~] = pwelch(x_B8ZS_z, window, noverlap, nfft, Fs);
[PxH_z, ~] = pwelch(x_HDB3_z, window, noverlap, nfft, Fs);

figure;
plot(f,10*log10(PxA_z+eps),'r','LineWidth',1.2); hold on;
plot(f,10*log10(PxP_z+eps),'b','LineWidth',1.2);
plot(f,10*log10(PxB_z+eps),'g','LineWidth',1.2);
plot(f,10*log10(PxH_z+eps),'m','LineWidth',1.2);
legend('AMI (zm)','Pseudoternária (zm)','B8ZS (zm)','HDB3 (zm)');
xlabel('Frequência (Hz)'); ylabel('PSD (dB/Hz)');
title('PSDs sem componente DC (comparação da forma espectral)');
grid on;
