clear all; clc;

OCTAVE = 1;

if OCTAVE == 1
pkg load communications;
end

RB = 100; % taxa de bits (bps)
Fp = 2000;
Fa = 8000;

on = 0; % controle se opera ou nao em tempo real

filename = 'sinal/sinal_rx.wav';

if on == 1
% captura do sinal de audio
NS = 0;             % nivel de sinal
NS_min = 0.1;       % nivel de sensibilidade - ajustar conforme necessario
t_captura = 4;      % tempo de captura do sinal
while NS < NS_min
    y = record(t_captura, Fa);
    if ~isempty(y)
      NS = max(y)
    end
end
disp(['Valor de deteccao do sinal: ' num2str(NS)]);

% salva arquivo com sinal para usar no receptor
audiowrite (filename, y, Fa);

else

[y, fs] = audioread(filename);
plot(y);

endif

% retorna a mensagem em bits e o tamanho dela
[m,l] = receptor_2(y, RB, Fp, Fa);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  Verificação do CRC-8                          %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

frame = m; % sequência completa recebida
disp(['Frame recebido (bits): ' num2str(frame(:)')]);

payload = frame(1:end-8);    % bits sem o CRC
%payload = payload(:)';       % força linha

crc_rx  = frame(end-7:end)'; % bits do CRC recebido
disp(['crcrx: ' num2str(crc_rx)]);
crc_calc = crc8(payload);    % CRC calculado
disp(['crccalc: ' num2str(crc_calc)]);


%disp(['CRC recebido: ' num2str(crc_rx)]);
%disp(['CRC calculado: ' num2str(crc_calc)]);

if isequal(crc_rx, crc_calc)
    disp('CRC OK: Nenhum erro detectado.');
else
    disp('CRC ERRO: Dados corrompidos na recepção.');
end


%%%% Segue o baile

% conversao de bits para texto
m = m(:)';                       % força linha
n_bits = floor(length(m)/8)*8;   % número de bits múltiplo de 8
m = m(1:n_bits);                 % descarta bits extras
l = length(m)/8;                 % corrige o tamanho
x = bi2de(reshape(m,8,l)')';     % conversão

msg = char(x);
disp(["Tamanho da mensagem recebida: " num2str(l) " bytes"]);
disp(["Mensagem recebida: " msg]);



