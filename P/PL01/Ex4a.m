n = 20;
N = 1e5;

for k=0:n
    k
    res(k+1) = simulador(0.5,k,n,N)
    prob(k+1)= nchoosek(n,k)*p^k*(1-p)^(n-k)
end

stem(0:n,res)

function probSimulacao = simulador(p,k,n,N)
    lancamentos = rand(n,N) > p; 
    sucessos = sum(lancamentos)==k;
    probSimulacao = sum(sucessos)/N;
end
