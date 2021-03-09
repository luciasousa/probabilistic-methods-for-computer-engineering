N=1e5;

alvos = randi(100,20,1e5);

for i=1:N
    res(i) = (length(unique(alvos(:,i)))==20);
end

prob = 1 - (sum(res)/N)