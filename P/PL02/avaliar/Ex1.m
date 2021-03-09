p1 = 0.002; %probabilidade de componente1 ter defeito
p2 = 0.005; %probabilidade de componente2 ter defeito
pa = 0.01; %probabilidade de brinquedo ter defeito por montagem
%A-"uma caixa de brinquedos tem pelo menos 1 brinquedo com defeito"
%alinea a
n = 8;  %caixa com 8 brinquedos
N = 1e5;
%8 componentes1 com 0.002 prob de defeito
comp1 = rand(n, N) < p1;
%8 componentes2 com 0.005 prob de defeito
comp2 = rand(n, N) < p2;
%brinquedo com 0.01 prob de defeito por montagem
mont = rand(n, N) < pa;

brinq = [comp1; comp2; mont];
def = sum(brinq);
c = 0;

for i=1:N
    %se numa caixa houver um ou mais componentes com defeito
    %ou brinquedo com defeito por montagem
    if def(i)>=1
        %conta numero de brinquedos com defeito
        c = c + 1;
    end
end
p = c/N;
fprintf('Probabilidade de pelo menos um brinquedo ter defeito = %f\n',p);

%alinea b
%contador de brinquedos com defeito por processo de montagem
countDM = 0;

for i=1:N
    %gerar valores aleatórios (8 componentes1, 8 componentes2, 8 montagem)
    tmp = randi(24);
    %se é do processo de montagem
    if tmp >= 16
        a = rand()<pa;
    %se é do componente1
    elseif tmp <= 8
        a=rand()<p1;
    %se é do componente2
    else
        a=rand()<p2;
    end
    %se tem defeito
    if a==1
        %e é por montagem
        if tmp>=16
            %incrementa o número de brinquedos com defeito por montagem
            countDM = countDM + 1;
        end
    end
end
numMedio = (countDM/N)










