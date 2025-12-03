% amostra_quant.m
function [s_out,sq_out]=amostra_quant(sig_in,td,ts, amp, L)

    if(rem(ts/td,1)==0)
    nfac=round(ts/td);
    s_out=downsample(sig_in,nfac);
    sq_out=quantizacao(s_out, amp, L);
    s_out=upsample(s_out,nfac);
    sq_out=upsample(sq_out,nfac);
    else
        warning('Erro! ts/td nao eh um inteiro!');
        s_out=[];sq_out=[];
    end
end

function x=quantizacao (sinal,amp,n)
% quantizacao
Delta=2*amp/n; % quantizacao uniforme
x = sinal + amp; % somar nivel CC igual a amp
q = floor(x/Delta); % dividir em intervalos iguais a D
x = Delta/2 + Delta*q - amp; % quantizar e remover nivel CC
end

% (uniquan.m)
function [q_out,Delta,SQNR]=uniquan(sig_in,L)
% L - numero de niveis de quantizacao uniforme
% sig_in - vetor para sinal de entrada
sig_pmax = max(sig_in); % pico positivo
sig_nmax = min(sig_in); % pico negativo

Delta=(sig_pmax - sig_nmax)/L; % intervalo de quantizacao
q_level = sig_nmax+Delta/2:Delta:sig_pmax-Delta/2; % define Q niveis

L_sig = length(sig_in); % comprimento do sinal
sigp = (sig_in-sig_nmax)/Delta+1/2; % converte a faixa de 1/2 a L+1/2
qindex=round(sigp); % arredonda a 1,2,...,L niveis
qindex=min(qindex,L); % elimina L+1, se houver
q_out=q_level(index); % usa vetor index para gerar saida
SQNR=20*log10(norm(sig_in)/norm(sig_in-q_out)); % valor da SQNR



end
