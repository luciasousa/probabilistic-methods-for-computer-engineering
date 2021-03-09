n = 20;
psd = 0.9;
pa = 0.001;
p1 = 0.002;
p2 = 0.005;
m1 = 1;
N = 1e6;
%20 componentes1 com 0.002 prob de defeito
comp1 = rand(n, N) < p1;
%20 componentes2 com 0.005 prob de defeito
comp2 = rand(n, N) < p2;
%brinquedo com 0.01 prob de defeito por montagem
mont = rand(n, N) < pa;
%n brinquedos
brinq = (comp1 | comp2 | mont);
def = sum(brinq);

c = 0;
for i=1:N
    %tirar 1 brinquedo de uma caixa por cada experiência com n brinquedos
    bri = randperm(n,m1);
    %se o brinquedo retirado não tem defeito
    if def(bri) == 0
        %caixa é comercializada
        c = c + 1;
    end
end
prob=c/N;

%alinea b

count = 0;
%matriz que vai conter, para cada m, o número de caixas comercializadas
caixasCom=zeros(1,19);
%para cada caixa
for j=1:N
    for i=1:19
        %tirar 1 brinquedo, tirar 2...tirar 19
        bri = randperm(n,i);
        %para cada matriz de brinquedos aleatórios
        for k=1:i
            %se nenhum tiver defeito
            if sum(def(bri(k))) == 0
                %incrementa num de caixas comercializadas
                caixasCom(i) = caixasCom(i) + 1;
            end
        end
    end
end
p=zeros(1,19);
for i=1:19
    %probabilidade para cada valor de num de caixas comercializadas
    p(i) = m(i)/N;
    %se probabilidade for no mínimo 90%
    if p(i) >= 0.9
        m = i
    end
end


        












