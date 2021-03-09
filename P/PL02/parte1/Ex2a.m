N=1e5;

alvos = randi(100,20,1e5);

for i=1:N
    %res=1 -- atingido só uma vez
    res(i) = (length(unique(alvos(:,i)))==20);
end

prob = sum(res)/N

