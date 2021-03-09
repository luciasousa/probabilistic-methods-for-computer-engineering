N=1e5; %num experiencias
p=0.5; %probabilidade de cara
k=6;   %numero de caras
n=15;   %numero de lancamentos
lancamentos = rand(n,N) > p; 
sucessos = sum(lancamentos)>=k; %pelo menos 6 caras
probSimulacao = sum(sucessos)/N