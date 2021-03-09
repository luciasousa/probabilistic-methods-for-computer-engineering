N=1e5; %10000 experiencias
p=0.5; %probabilidade 50
k=2;   %numero de caras
n=3;   %numero de lancamentos
lancamentos = rand(n,N) > p; %matriz 3 linhas 10000 colunas
sucessos = sum(lancamentos)==k; 
probSimulacao = sum(sucessos)/N