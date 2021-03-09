%1 aluno - 2 aulas às 9h na 4ª e 6ª
%presente na anterior p("ir à aula")=0,7
%faltou na anterior p("ir à aula")=0,8

%alinea a
%se está presente na 4ª qual a prob de estar presente na próxima 4ª

%matriz transição de estados
%1 - não ir à aula
%2 - ir à aula

T = [0.2 0.3
     0.8 0.7];

sum(T);

x = [0
     1];

%na proxima aula
x1 = T * x;
%duas aulas depois
x2 = T^2 * x;

respostaA=x2(2)

%alinea b - nao estiver presente na aula de quarta numa determinada semana, qual a probabilidade de estar ˜
%presente na aula de quarta da semana seguinte

x = [1
     0];

%duas aulas depois
x2 = T^2 * x;

respostaB=x2(2)

%alinea c - e esteve presente na primeira aula, qual a probabilidade de estar na ultima aula
%assumindo que o semestre tem exactamente 15 semanas de aulas e nao existem feriados

x = [0
     1];

%29 aulas depois
x2 = T^(30-1) * x;

respostaC=x2(1)

%alinea d -  grafico a probabilidade de faltar a cada uma das 30 aulas, assumindo que a 
%probabilidade de estar presente na primeira aula e de 85%
v = [0.15;0.85];

res = zeros(1,30);

res(1) = 0.15;

for i=2:30
    v = T*v;
    res(i) = v(1);
end
    
plot(res,'*')
    
    
    
    
    



