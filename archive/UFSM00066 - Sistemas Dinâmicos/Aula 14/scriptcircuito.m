% 1. Planta RLC
R = 133.6; L = 1.67; C = 100e-6;

% 2. Planta G(s) simplificada
G = tf(1, [L*C, R*C, 1]);

% 3. Sintonia do Controlador PID usando a função nativa do MATLAB
C_pid = pid(4.5, 80.0, 0.08); % pid(Kp, Ki, Kd)

% 4. Sistema em Malha Fechada e Vetor de Tempo
Malha_Fechada = feedback(C_pid * G, 1);
t = linspace(0, 0.5, 1000)';

% --- SIMULAÇÕES E CÁLCULO DE ERRO ---
% Degrau (O MATLAB subtrai o escalar 1 do vetor automaticamente)
[saida_deg, ~] = step(Malha_Fechada, t);
erro_deg = 1 - saida_deg; 

% Rampa
ref_rampa = t;
[saida_ram, ~] = lsim(Malha_Fechada, ref_rampa, t);
erro_ram = ref_rampa - saida_ram;

% 5. Geração dos Gráficos (Sintaxe de plot combinada)
figure('Name', 'Simulação do Sistema RLC com PID', 'NumberTitle', 'off');

% Degrau e Erro
subplot(2, 2, 1);
plot(t, ones(size(t)), 'k--', t, saida_deg, 'b-', 'LineWidth', 1.5);
title('Acompanhamento de Entrada em Degrau'); ylabel('Tensão (V)'); grid on;
legend('Referência', 'Saída Vo(t)', 'Location', 'best');

subplot(2, 2, 2);
plot(t, erro_deg, 'r-', 'LineWidth', 1.5);
title('Erro de Seguimento (Degrau)'); ylabel('Erro (V)'); grid on;

% Rampa e Erro
subplot(2, 2, 3);
plot(t, ref_rampa, 'k--', t, saida_ram, 'g-', 'LineWidth', 1.5);
title('Acompanhamento de Entrada em Rampa'); xlabel('Tempo (s)'); ylabel('Tensão (V)'); grid on;
legend('Referência', 'Saída Vo(t)', 'Location', 'best');

subplot(2, 2, 4);
plot(t, erro_ram, 'r-', 'LineWidth', 1.5);
title('Erro de Seguimento (Rampa)'); xlabel('Tempo (s)'); ylabel('Erro (V)'); grid on;
