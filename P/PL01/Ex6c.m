p = 0.3;%probabilidade de cada torneira ter defeito
n = 5;  %amostra de 5 peças
N = 50;

for k=0:n
    res(k+1) = simulador(k,n,N)
    histogram(res)
end

function prob = simulador(k,n,N)
    experiencia = randi([0 1],1,n);
    defeito = experiencia > 0.7; %1-0.3
    resultados = sum(defeito);
    def = resultados==k; %k peças defeituosas
    prob = sum(def)/n;
end


