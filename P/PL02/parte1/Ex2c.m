m = [1e3 1e5];
for i=1:2
    toPlot=zeros(1,100);
    for j=1:10:100
        toPlot(j)=prob(j,m(i));
    end
    toPlot=toPlot(1:10:100);
    subplot(1,2,i);
    plot(1:10:100,toPlot)
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
        end;
    end;
    p = count/counter2;
end



