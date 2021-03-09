%array length=T funçao return 0 a T-1 
%pelo menos 2 keys mapeadas para a mesma pos do array
%10 keys e T = 1000

nKeys=10;
pool = randi(1000, nKeys, 1e4); 
fav=1:1e4;
for n =1:1e4
    fav(n)= length(unique(pool(:,n)))==1000;
end
res=1-(sum(fav)/1e4)

%b
nKeys=100;
toPlot=zeros(1,nKeys);
for n=1:10
    toPlot(n)=prob(nKeys, 1000);
end
plot(toPlot);

function p = prob(n, alvos)
    pool = randi(alvos,n,1e3);
    count=0;
    counter2=0;
    for k=1:length(pool)
        uni=unique(pool(:,k));
        len=length(uni);
        counter2=counter2+1;
        if(len<n)
            count=count+1;
        end;
    end;
    p = (count/counter2)*100;
end