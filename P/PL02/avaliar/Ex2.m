%alinea a
%B - "caixa sem brinquedos com defeito"
%P(B)= ??

p1 = 0.002; %probabilidade de componente1 ter defeito
p2 = 0.005; %probabilidade de componente2 ter defeito
pa = 0.01; %probabilidade de brinquedo ter defeito por montagem
n1 = 8;
N = 1e6;
%8 componentes1 com 0.002 prob de defeito
comp1 = rand(n1, N) < p1;
%8 componentes2 com 0.005 prob de defeito
comp2 = rand(n1, N) < p2;
%brinquedo com 0.001 prob de defeito por montagem
mont = rand(n1, N) < pa;

brinq = [comp1; comp2; mont];
def = sum(brinq);
c = 0;

for i=1:N
    if def(i)==0
        c = c + 1;
    end
end
p = c/N;
fprintf('Probabilidade de nenhum brinquedo ter defeito = %f\n',p);

%alinea b -- valor teórico
b=(0.998^8)*(0.995^8)*(0.99^8)


%alinea c
n=2:20;
y=zeros(1,19);
for i=2:20
    y(i-1) = (0.998^i)*(0.995^i)*(0.99^i);
end
plot(n,y)
grid on
xlabel('n');
ylabel('P(B)');


%alinea d -- capacidade da caixa para nao ter brinq c/def tenha pelo menos 90%




