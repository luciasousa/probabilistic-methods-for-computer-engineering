p = 0.5; %ser rapaz ser rapariga
n = 2;   %num de filhos
k = 1;   %filho rapaz
N = 1e5; %familias

filhos = randi([0 1], n, N) > p;     
a1 = sum(filhos)==2;                %2rapazes
a2 = filhos(1,:);                   %primeiro filho rapaz
prob = sum(a1 & a2)/sum(a2)

%MM MF
teorica = 1/2