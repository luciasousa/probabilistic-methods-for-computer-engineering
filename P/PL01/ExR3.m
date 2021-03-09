n = 10; %perguntas
p = 0.5; %probabilidade de acertar

%function prob = f(n,p)
    perg = randi([0 1],1,n)
    certa = perg > p;
    res = sum(certa); %soma é 10
    sucesso = res==n; %todas as respostas estiverem a 1
    possibilidades = 2^n;
    prob = sum(sucesso)/possibilidades
%end