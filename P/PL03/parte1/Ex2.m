%alinea a
%    A   B     C
T = [1/3 1/4   0
     1/3 11/20 1/2
     1/3 1/5   1/2];
%estocástica
sum(T); %==1
%entradas são não negativas

%alinea c
%90 alunos, A-60, B-15, C-15
si = [2/3
      1/6
      1/6];
 
 v = T^(30-1)*si;
 
 fprintf('fim de 30 aulas\n elem A = %.0f\n elem B = %.0f\n elem C = %.0f\n',v(1)*60,v(2)*15,v(3)*15);
 
 %alinea d
 si = [1/3
       1/3
       1/3];
 
 v = T^(30-1)*si;
 
fprintf('fim de 30 aulas\n elem A = %.0f\n elem B = %.0f\n elem C = %.0f\n',v(1)*30,v(2)*30,v(3)*31);