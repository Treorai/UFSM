simulink
num=1;
den=[1 1 1];
G=tf(num,den)
pidtool(G)