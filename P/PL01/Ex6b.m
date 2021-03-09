p = 0.3;%probabilidade de cada torneira ter defeito
n = 5;  %amostra de 5 peças
k = 3;  %3 peças defeituosas

experiencia = randi([0 1],1,5);
defeito = experiencia > 0.7; %1-0.3
resultados = sum(defeito);
def = resultados<=2; %maximo de 2 peças defeituosas
prob = sum(def)/5

