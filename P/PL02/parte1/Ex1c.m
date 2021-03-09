p = 0.5; %ser rapaz ser rapariga
n = 2;   %num de filhos
k = 1;   %filho rapaz
N = 1e5; %familias

filhos = randi([0 1], n, N) > p;     
a1 = sum(filhos)>1;                %2rapazes
a2 = sum(filhos)>0;                %pelo menos 1 rapaz
prob = sum(a1 & a2)/sum(a2)

%MM MF FM
teorica = 1/3