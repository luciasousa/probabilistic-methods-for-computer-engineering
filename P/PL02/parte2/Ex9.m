%X - classificaçao dos alunos (continua e dist normal)
media = 14;
desvio = 2;

x = 0:20;
fx=zeros(1,21);

for i=x
    fx(i+1) = (1/(sqrt(2*pi)*desvio))*exp(-((i-media)^2)/(2*(desvio^2)));
end
%alinea a - 1 aluno ter classificação entre 12 e 16

pa = sum(fx(12:16))

%alinea b - alunos com classificaçoes entre 10 e 18

pb = sum(fx(10:18))

%alinea c - 1 aluno ter classificaçao >= 10

pc = sum(fx(10:20))

%alinea d - normcdf()

pd = normcdf(x)
