%A - soma dos dois valores ser == 9 
d = 6;
N = 1e5;

dado = randi([1 6],2,N);
soma = sum(dado) == 9;
probA = sum(soma)/N

%B - segundo valor é par
segLinha = dado(2,:);
count = 0;
for i=1:N
    if mod(segLinha(i),2)==0
        count = count + 1;
    end
end

probB = count/N

%C - pelo menos um é == 5
%casos favoraveis = 11
%possiveis = 36
count2 = 0;
primLinha = dado(1,:);
for i=1:N
    if (primLinha(i) == 5) || (segLinha(i) == 5)
        count2 = count2 + 1;
    end
end
probC = count2/N

%D - nenhum dos valores é 1
count3 = 0;
for i=1:N
    if (primLinha(i) ~= 1) && (segLinha(i) ~= 1)
        count3 = count3 + 1;
    end
end

probD = count3/N