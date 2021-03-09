%alinea a - retirar uma nota, espaço de amostragem e probabilidades

%90 notas -- 5 euros -- 90/100
%9 notas --- 50 euros -- 9/100
%1 nota ---- 100 euros -- 1/100

nota = 1:100;
pNota = ones(1,100)/100;
%stem(nota,pNota)
xlabel('nota');
ylabel('P(nota)');

%alinea b - funçao massa de probabilidade

xi = [5 50 100];
quant = [90 9 1];
Px = quant/100;

%alinea c - funçao distribuiçao acumulada

Fx = Px;
stairs(xi, Fx)
