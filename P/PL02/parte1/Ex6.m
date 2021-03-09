%alinea a - seq "um" "dois"
N = 1e5;
seq = randi([1 3],2,N);
l1 = seq(1,:);
l2 = seq(2,:);
counta = 0;

for i=1:N
    if (l1(i)==1 && l2(i)==2)
        counta = counta + 1;
    end
end

probA = counta/N

%alinea b - seq "um" aparecer pelo menos 1 vez
countb = 0;
for j=1:N
    if (l1(j)==1 || l2(j)==1)
        countb = countb + 1;
    end
end

probB = countb/N

%alinea c - seq "um" ou "dois" aparecerem
countc = 0;
for k=1:N
    if (l1(k)==1 || l1(k)==2 || l2(k)==1 || l2(k)==2)
        countc = countc + 1;
    end
end

probC = countc/N
        
%alinea d - P[“seq inclui um” | “seq inclui dois”]
%P[“seq inclui um” e "seq inclui dois"]/P["seq inclui dois"]
countx = 0;
county = 0;
for m=1:N
    if ((l1(m)==1 && l2(m)==2) || (l1(m)==2 && l2(m)==1))
        countx = countx + 1;
    end
end

for n=1:N
    if (l1(n)==2 || l2(n)==2)
        county = county + 1;
    end
end

pUmDois = countx/N
pDois = county/N

pCondicional = pUmDois/pDois

