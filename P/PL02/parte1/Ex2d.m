m = [200 500 1e3 2e3 5e3 1e4 2e4 5e4 1e5];

for j=1:9
    y = prob(100,m(j)); 
    plot(m,y)
end

function p = prob(n, alvos)
    pool = randi(alvos,n,1e5);
    count=0;
    counter2=0;
    for k=1:length(pool)
        u=unique(pool(:,k));
        l=length(u);
        counter2=counter2+1;
        if(l<n)
            count=count+1;
        end
    end
    p = count/counter2;
end

