clear all; close all; clc;

%pkg load signal

Ts = 16; % pontos por simbolo
Tb = Ts; % tempo de duracao do bit
Nb=10000; % numero de bits
B=rand(1,Nb)>0.5; % gera Nb bits aleatoriamente
T = 1:50*Tb; % tempo usado para mostrar grafico

% pulsos
% pulso NRZ
pulso_nrz = ones(1, Ts);

% pulso RZ
pulso_rz = ones(1, Ts/2);
pulso_rz(Ts/2+1:Ts) =  zeros(1, Ts/2);

%pulso = pulso_nrz;
pulso = pulso_rz;

%Codifição polar NRZ
NRZ = []; 
for b=B
    if (b==0)
        simbolo = -1;
    else
        simbolo = 1;
    end
    
    NRZ = [NRZ simbolo*pulso];
   
end

figure;
subplot(611);
p=plot(T,NRZ(T));
title('NRZ')
axis([0 length(T) -2 2]);
set(p,'Color','black','LineWidth',2.5)

% codigo NRZI
NRZI = [];

simbolo=-1;
for b = B
    if(b==1)
        simbolo = simbolo*(-1);
    end

    NRZI = [NRZI simbolo*pulso];
end

%grafico
subplot(612);
p=plot(T,NRZI(T));
title('NRZI');
axis([0 length(T) -2 2]);
set(p,'Color','black','LineWidth',2.5)

%% Bipolar AMI
AMI = [];

aux = 1;
for b=B
    if (b == 1)
        if (aux == 1)
            simbolo = 1;
            aux = 0;
        else 
            simbolo = -1;
            aux = 1;
        end
    else
         simbolo = 0;
    end

    AMI = [AMI simbolo*pulso];
end

%grafico
subplot(613);
p=plot(T,AMI(T));
title('AMI')
axis([0 length(T) -2 2]);
set(p,'Color','black','LineWidth',2.5)

%PSEUDOTERNARIA
PSEUD = []; 

aux = 1;
for b=B
    if (b == 0)
        if (aux == 1)
            simbolo = 1;
            aux = 0;
        else 
            simbolo = -1;
            aux = 1;
        end
    else
         simbolo = 0;
    end
    
    PSEUD = [PSEUD simbolo*pulso];
        
end

subplot(614);
p=plot(T,PSEUD(T));
title('Pseudoternaria')
axis([0 length(T) -2 2]);
set(p,'Color','black','LineWidth',2.5)

%%MANCHESTER
MANCH=[];

m=1;
for b=B 
    if (b==0)
        simbolo=1; 
    else 
        simbolo=-1;
    end;
    
    MANCH = [MANCH simbolo*pulso(1:Ts/2) (-1)*simbolo*pulso(Ts/2+1:Ts)];
   
end;

subplot(615);
p=plot(T,MANCH(T));
title('Manchester')
axis([0 length(T) -2 2]);
set(p,'Color','black','LineWidth',2.5)

%
%%MANCHESTER DIFERENCIAL 

DIFFMANCH=[];
aux=-1;
for b=B
    if (b==0)
        simbolo=aux; 
    elseif (b==1 && aux==-1) 
        simbolo=1;
        aux=1;
    else
        simbolo=-1;
        aux=-1;
    end;
    
    DIFFMANCH = [DIFFMANCH simbolo*pulso(1:Ts/2) (-1)*simbolo*pulso(Ts/2+1:Ts)];

end;

subplot(616);
p=plot(T,DIFFMANCH(T));
title('Manchester Diferencial')
axis([0 length(T) -2 2]);
set(p,'Color','black','LineWidth',2.5)

% Calculo de PSDs

% PSD usando metodo de Welch (pode ser usado tambem o periodogram)

figure;
hold on;

%Hpsd=psd(spectrum.welch,NRZ); % matlab
[Hpsd,f] = pwelch(NRZ); %octave
handle1=plot(Hpsd);
set(handle1,'LineWidth',2,'Color','r');

%Hpsd=psd(spectrum.welch,MANCH); % matlab
[Hpsd,f] = pwelch(MANCH); %octave
handle1=plot(Hpsd);
set(handle1,'LineWidth',2,'Color','b')

%Hpsd=psd(spectrum.welch,AMI); % matlab
[Hpsd,f] = pwelch(AMI); ; %octave
handle1=plot(Hpsd);
set(handle1,'LineWidth',2,'Color','g')


%%%%%%%%%%%%%%%%%%

% --- Converter NRZ polar para NRZ unipolar ---
% mapeamento: -1 -> 0, +1 -> 1
NRZ_unipolar = (NRZ + 1) / 2;   % escala linear: -1..+1 -> 0..1

% --- Mostrar trecho do sinal ---
figure;
subplot(211);
plot(T, NRZ(T));
title('NRZ Polar');
axis([0 length(T) -2 2]);

subplot(212);
plot(T, NRZ_unipolar(T));
title('NRZ Unipolar');
axis([0 length(T) -0.5 1.5]);

% --- PSDs comparativas usando Welch ---
figure; hold on;
[Px_polar,f] = pwelch(NRZ,[],[],[],1);           % sinal polar
[Px_unipol, ~] = pwelch(NRZ_unipolar,[],[],[],1);% sinal unipolar

plot(f,10*log10(Px_polar),'LineWidth',2);
plot(f,10*log10(Px_unipol),'LineWidth',2);
legend('NRZ Polar','NRZ Unipolar');
xlabel('Frequência (normalizada)');
ylabel('PSD (dB/Hz)');
grid on;
