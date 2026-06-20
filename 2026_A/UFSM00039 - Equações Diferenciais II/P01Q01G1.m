clear;
clc;
close all;

% Ordem máxima
Nmax = 30;

% Coeficientes da solução 1
c = zeros(1,Nmax+1);

c(1) = 1;   % c0
c(2) = 0;   % c1

for k = 0:(Nmax-2)

    A = k*(k-1)/9 + 7*k/4 + 1/7;

    term = A*c(k+1);

    if k >= 1
        term = term + (8/7)*c(k);
    end

    term = term + (4/5)*(k+1)*c(k+2);

    c(k+3) = -term/(2*(k+2)*(k+1));

end

x = linspace(-2,2,1000);

ordens = [4 9 15 21 30];

figure;
hold on;
grid on;

for n = ordens

    y = zeros(size(x));

    for k = 0:n
        y = y + c(k+1)*x.^k;
    end

    plot(x,y,'LineWidth',1.5);
end

legend('n=4','n=9','n=15','n=21','n=30');
xlabel('x');
ylabel('y_n(x)');
title('Aproximações por Série de Potências');
