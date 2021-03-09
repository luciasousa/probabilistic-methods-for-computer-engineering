%15 mensagens por segundo -- Poisson

%alinea a - p de num intervalo de 1 segundo nao receber mensagem
%x (variavel aleatoria) - num de mensagens num segundo
%p(x=0)
lambda = 15;
poisson = (lambda^0) / (exp(15)*factorial(0))

%alinea b - p de num intervalo de 1 segundo receber + de 10 mensagens

x = [10 11 12 13 14 15];
s=0;
for i=x
    p(i)=(lambda^i) / (exp(15)*factorial(i));
    s = s+p(i);
end

poi = s