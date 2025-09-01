% amostragem.m
function [s_out]=amostragem(sig_in,td,ts)

    if(rem(ts/td,1)==0)
        nfac=round(ts/td);
        s_out=downsample(sig_in,nfac);
        s_out=upsample(s_out,nfac);
    else
        warning('Erro! ts/td não é um inteiro!');
        s_out=[];
    end
end
