function [x,l] = receptor_0(yrx, TB, Fp, Fa)
%%%%%%%%%%%%%%%%%%%%%%  Entrada do receptor   %%%%%%%%%%%%%%%%
%   yrx -- sinal de audio capturado
%   TB  -- Taxa de bits
%   Fp  -- Frequencia da portadora
%   Fa  -- Frequencia de amostragem da placa de som
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Exemplo de uso
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% TB = 100;
% Fp = 2000;
% Fa = 8000;
% y = record(10,Fa); % grava 10s de audio
% sinal_recebido = receptor(y,TB, Fp, Fa)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Pacotes de software
pkg load signal;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%               Demodulacao                      %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
y = yrx;
t = (0:length(y) - 1)/Fa;         % instantes de amostragem
y = y.*cos(2*pi*Fp*t)';

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%      Sincronizacao de simbolo                  %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
yf = y;
st = ceil(Fa/TB);
si=st:st:length(yf);
y = yf(si);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%      Decodificacao                              %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
x = y > 0;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%     Sincronizacao do quadro                      %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
SFD = [1 1 0 0 1 1 1 0 0 0 1 1 1 1 0 0 0 0 1 1 1 0 0 0 1 1 0 0 1 0 1 0];
xc = xcorr(SFD*2 -1,double(x)*2 - 1);
[a,b] = max(abs(xc));
if a < length(SFD)*0.9
  disp('Muitos erros para decodificar os dados');
end
if xc(b) < 0
    x = ~x;
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   Remover cabecalho SFD                        %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
b = length(x) - b + length(SFD);
x = x(b+1:end);
l = bi2de(x(1:8)'); % primeiro byte eh o numero de bytes da mensagem
x = x(9:min(end,(l+1)*8)); % retorna a mensagem recebida

endfunction
