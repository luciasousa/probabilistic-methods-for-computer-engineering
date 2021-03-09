p = 0.5; %ser rapaz ser rapariga
n = 2;   %num de filhos
k = 1;   %filho rapaz
N = 1e5; %familias
nFavoraveis = 3; %MM FM MF
nPossiveis = 4;  %MM FM MF FF

filhos = randi([0 1], n, N) > p;
rapaz = sum(filhos)>0;
prob = sum(rapaz)/N

probTeorica = nFavoraveis/nPossiveis
