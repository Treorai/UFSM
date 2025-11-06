msg = "OLA";
RB = 100;       % taxa de bits
Fp = 2000;      % frequencia da portadora
Fa = 8000;      % taxa de amostragem da placa de som
disp(["Mensagem transmitida: " msg]);
ytx = transmissor(msg, RB, Fp, Fa);
[m,l] = receptor_0(ytx', RB, Fp, Fa);
x = bi2de(reshape(m,8,l)')';
msg = char(x);
disp(["Mensagem recebida: " msg]);


