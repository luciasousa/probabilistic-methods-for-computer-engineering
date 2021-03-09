n = 1;
p = 0;
N=1e5;

while(p<0.5)
    n = n+1;
    a=randi(365,n,N);
    res= true(1,N);
    for i=1:N
        res(i)=length(unique(a(:,i)))<n;
    end
    p=sum(res)/N;
end

fprintf('Resultado = %d\n',n)
%principio da casa dos pombos
%ineq = (1 - (factorial(365)/(factorial(365-n)* (365^n)))) > 0.5;
%v = solve(ineq, n > 0, n, 'ReturnConditions', true)
