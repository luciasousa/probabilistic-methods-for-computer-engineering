%alinea a - funçao massa de probabilidade
%e={0,1,2,3,4}
%4 lançamentos, X - numero de coroas

N=1e5;
exp = rand(4,N)>=0.5;
%ou exp = randi([0 1],4,N);

num = sum(exp);         %num de coroas
x = 0:4;
fx=zeros(1,5);
for i=x
   %num==i ----> vetor em que num de coroas = i
   fx(i+1) = sum(num==i)/N;
end

stem(x,fx)
grid on
axis([-1 5 0 0.4]);
xlabel('x');
ylabel('f(x)');

%alinea b
%valor esperado(media), variancia, desvio padrao

vEsperado = sum(fx.*x)    %fx.*x -- multiplicaçao elemento a elemento

%var = E(x^2)-media^2
% . - cada elemento
var = sum(fx.*(x.^2)) - vEsperado^2

desvioPadrao = sqrt(var)
%ou desvio = var^0.5

%alinea c e d

x = 0:4;
fx=zeros(1,5);
for i=x
    %fx(i+1)=nchoosek(4,i)*0.5^(4-i)*0.5^(i);
    fx(i+1)=nchoosek(4,i)*0.5^4;
end

figure(2)
stem(x,fx)
grid on
axis([-1 5 0 0.4]);

%alinea e

vEsperado = sum(fx.*x)
var = sum(fx.*(x.^2)) - vEsperado^2

%alinea f

fprintf('Probabilidade de obter pelo menos 2 coroas = %f\n',sum(fx(3:5)));
fprintf('Probabilidade de obter ate 1 coroa = %f\n',sum(fx(1:2)));
fprintf('Probabilidade de obter entre 1 e 3 coroas = %f\n',sum(fx(2:4)));







