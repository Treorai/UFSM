clear all
clc
close all

t = 0:0.01:20;

%=======================================
% FUNÇÃO DO SISTEMA
%=======================================
function dx = sistema(t,x,m1,m2,k1,k2,b,caso)

y1 = x(1);
y1d = x(2);
y2 = x(3);
y2d = x(4);

switch caso
    case 1
        u = 0;
    case 2
        u = 2;
    case 3
        u = 0;
    case 4
        u = sin(t);
end

dx = zeros(4,1);

dx(1) = y1d;

dx(2) = (-b*y1d -(k1+k2)*y1 + b*y2d)/m1;

dx(3) = y2d;

dx(4) = (b*y1d - b*y2d + u)/m2;

end


%=======================================
% CASO A
%=======================================

b=0.5; k1=1.5; k2=15; m1=1; m2=1;

x0=[0 0 0 1/m2];

[t,x] = ode45(@(t,x) sistema(t,x,m1,m2,k1,k2,b,1),t,x0);

y1 = x(:,1);
y2 = x(:,3);

figure
plot(t,y1,'r',t,y2,'b')
title('Caso A')
legend('y1','y2')
grid on


%=======================================
% CASO B
%=======================================

b=1; k1=1; k2=1; m1=10; m2=1;

x0=[0 0 0 0];

[t,x] = ode45(@(t,x) sistema(t,x,m1,m2,k1,k2,b,2),t,x0);

y1 = x(:,1);
y2 = x(:,3);

figure
plot(t,y1,'r',t,y2,'b')
title('Caso B')
legend('y1','y2')
grid on


%=======================================
% CASO C
%=======================================

b=1.5; k1=0.5; k2=15; m1=10; m2=1;

x0=[0 0 0 1/m2];

[t,x] = ode45(@(t,x) sistema(t,x,m1,m2,k1,k2,b,3),t,x0);

y1 = x(:,1);
y2 = x(:,3);

figure
plot(t,y1,'r',t,y2,'b')
title('Caso C')
legend('y1','y2')
grid on


%=======================================
% CASO D
%=======================================

b=1; k1=1; k2=4; m1=1; m2=1;

x0=[0 0 0 0];

[t,x] = ode45(@(t,x) sistema(t,x,m1,m2,k1,k2,b,4),t,x0);

y1 = x(:,1);
y2 = x(:,3);

figure
plot(t,y1,'r',t,y2,'b')
title('Caso D')
legend('y1','y2')
grid on
