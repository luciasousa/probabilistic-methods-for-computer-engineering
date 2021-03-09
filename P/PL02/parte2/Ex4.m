% 30% com defeito, 5 peças
% X - num de peças defeituosas

%alinea a 
%i)funçao massa de probabilidade: prob que cada valor pode assumir

N=1e6;
exp = rand(5,N)>=0.7;

def = sum(exp);         %num de peças defeituosas

x = 0:5;                %{0,1,2,3,4,5}
fx = zeros(1,6);

for i=x
   fx(i+1) = sum(def==i)/N; 
end

stem(x,fx)
grid on
xlabel('x');
ylabel('f(x)');

%ii)funçao distribuiçao acumulada: F(x) = P(X <= x)
Fx = zeros(1,6);
soma = 0;
for i=x
    soma = soma + sum(fx(i+1)); 
    Fx(i+1) = soma;
end
figure(2)
stairs(x,Fx)
grid on
xlabel('x');
ylabel('f(x)');

%iii) probabilidade de no max 2 peças serem D (D--0/1/2)

fprintf('Probabilidade no máx 2 peças serem defeituosas = %f\n',sum(fx(1:3)));

%alinea b
%i)funçao distribuiçao acumulada: F(x) = P(X <= x) ANALITICA
%calcular função massa e depois a acumulada
x = 0:5;
fx=zeros(1,6);
for i=x
    %formula distribuição binomial
    fx(i+1)=nchoosek(5,i)*0.7^(5-i)*0.3^(i);
end
figure(3);
stem(x,fx)
grid on
xlabel('x');
ylabel('f(x)');
Fx = zeros(1,6);
soma = 0;
for i=x
    soma = soma + sum(fx(i+1)); 
    Fx(i+1) = soma;
end
figure(4)
stairs(x,Fx)
grid on
xlabel('x');
ylabel('f(x)');

fprintf('Probabilidade no máx 2 peças serem defeituosas analitica = %f\n',sum(fx(1:3)));


