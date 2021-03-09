%motor de aviao falha prob=p
p = logspace(-3,log10(1/2),100)

%aviao de 2 motores despenha-se se os 2 motores falharem
for i=1:100
    p2(i)=nchoosek(2,2)*p(i)^(2)*(1-p(i))^(2-2);
end

%aviao de 4 motores despenha-se se 3 ou 4 falharem
for i=1:100
    p4(i)=nchoosek(4,3)*p(i)^(3)*(1-p(i))^(4-3) + nchoosek(4,4)*p(i)^(4)*(1-p(i)).^(4-4);
end
%p4/p2=p(4-3p)

stem(p,p2)
grid on
xlabel('p');
ylabel('p2');

figure(2)
stem(p,p4)
grid on
xlabel('p');
ylabel('p4');

