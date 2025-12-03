function [x,l] = receptor_1(yrx, TB, Fp, Fa)
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


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%      Sincronizacao com Costas Loop   	    %
% https://en.wikipedia.org/wiki/Costas_loop %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
y = yrx;							% sinal a ser sincronizado
t = (0:length(y) - 1)/Fa;           % instantes de amostragem
fle=64;                             % ordem do filtro
h=fir1(fle,0.001);                  % LPF design
mu=0.03;                            % Tamanho do passo do algoritmo
theta=zeros(1,length(t));           % Inicializar vetor de estimativa
theta(1) = 0;                       % fase inicial
zs=zeros(1,fle+1);zc=zeros(1,fle+1);% buffers para LPFs
for k=1:length(t)-1
  zs=[zs(2:fle+1), 2*y(k)*sin(2*pi*Fp*t(k)+theta(k))];
  zc=[zc(2:fle+1), 2*y(k)*cos(2*pi*Fp*t(k)+theta(k))];
% nova saida dos filtros
  lpfs=fliplr(h)*zs';

  lpfc=fliplr(h)*zc';
  theta(k+1)=theta(k)-mu*lpfs*lpfc; % Atualizacao do algoritmo
end


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%               Demodulacao                      %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

y = y.*cos(2*pi*Fp*t + theta)';

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
