%componente1 + componente2 = brinquedo
%1 caixa -> n brinquedos
%componente1 com defeito
p1 = 0.002;
%componente2 com defeito
p2 = 0.005;
%brinquedo com defeito se pelo menos 1 componente com defeito
%briquedo com defeito, mesmo com componentes sem defeito
pa = 0.01;

%alinea a
n = 8;
N = 1e6;
%8 componentes1 com 0.002 prob de defeito
comp1 = rand(n, N) < p1;
%8 componentes2 com 0.005 prob de defeito
comp2 = rand(n, N) < p2;
%brinquedo com 0.001 prob de defeito por montagem
mont = rand(n, N) < pa;

brinq = [comp1; comp2; mont];

def = sum(brinq);
%x - variável aleatoria do num de brinquedos com defeito
x = 0:n;            %0 brinq c/def até n brinq c/def
fx=zeros(1,9);
for i=x
    %função massa probabilidade
    fx(i+1) = sum(def==i)/N;
end
figure(1);
stem(x,fx)
grid on
xlabel('x');
ylabel('f(x)');

%alinea b

b1 = sum(fx(3:9))

%alinea c -- valor esperado, var, desvio padrao
vEsperado1 = sum(fx.*x)
var1 = sum(fx.*(x.^2)) - vEsperado^2
desvioPadrao1 = sqrt(var)

%alinea a
n = 16;
N = 1e6;
%8 componentes1 com 0.002 prob de defeito
comp1 = rand(n, N) < p1;
%8 componentes2 com 0.005 prob de defeito
comp2 = rand(n, N) < p2;
%brinquedo com 0.001 prob de defeito por montagem
mont = rand(n, N) < pa;

brinq = [comp1; comp2; mont];


def = sum(brinq);
%x - variável aleatoria do num de brinquedos com defeito
x = 0:n;            %0 brinq c/def até n brinq c/def
fx=zeros(1,17);
for i=x
    %função massa probabilidade
    fx(i+1) = sum(def==i)/N;
end
figure(2);
stem(x,fx)
grid on
xlabel('x');
ylabel('f(x)');

%alinea b -- X>=2

b = sum(fx(3:17))

%alinea c -- valor esperado, var, desvio padrao
vEsperado = sum(fx.*x)
var = sum(fx.*(x.^2)) - vEsperado^2
desvioPadrao = sqrt(var)

