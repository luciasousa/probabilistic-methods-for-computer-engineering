%alinea a

T = [0.7 0.2 0.3
     0.2 0.3 0.3
     0.1 0.5 0.4];
sum(T);

%alinea b - p de estar sol no 2º e 3º dia de jan quando o 1º foi sol
%P(sol)*P(sol->sol)*P(sol->sol)
r = 1*T(1,1)*T(1,1);
fprintf('alinea b\n');
fprintf('probabilidade de estar sol no 2º e 3º dia: %.3f\n',r);
fprintf('\n');

%alinea c - p de nao chover nem no 2º nem no 3º dia quando 1º é sol
%p(sol)*(p(sol->sol) + p(sol->nuvens))
v = [1
     0
     0];
v2 = T*v;
w = v2/(v2(1)+v2(2)); %prob do sol e das nuvens
v(3) = 0;  %prob de chuva
v3 = T * w;
r = v(1)* (v2(1)+v2(2)) * (v3(1)+v3(2));
fprintf('alinea c\n');
fprintf('probabilidade de não chover no 2º e 3º dia: %.3f\n',r);
fprintf('\n');

%alinea d - 1º dia sol, resto do mês num medio de dias de sol/chuva/nuvens

v = [1; 0; 0];
count_sol = v(1);
count_nuv = v(2);
count_chuv = v(3);
for i= 2:31
    v = T*v;
    count_sol = count_sol + v(1);
    count_nuv = count_nuv + v(2);
    count_chuv = count_chuv + v(3);
end
fprintf('alinea d\n');
fprintf('sol: %.2f\nnuvens: %.2f\nchuva: %.2f\n',count_sol,count_nuv,count_chuv);
fprintf('\n');
%alinea e - 1ºdia chuva, nº medio de dias de sol, chuva,nuvens

v = [0; 0; 1];
count_sol = v(1);
count_nuv = v(2);
count_chuv = v(3);
for i= 2:31
    v = T*v;
    count_sol = count_sol + v(1);
    count_nuv = count_nuv + v(2);
    count_chuv = count_chuv + v(3);
end
fprintf('alinea e\n');
fprintf('sol: %.2f\nnuvens: %.2f\nchuva: %.2f\n',count_sol,count_nuv,count_chuv);
fprintf('\n');

%alinea f - 0.1->sol; 0.3->nuvens; 0.5->chuva

v = [1; 0; 0];
count1 = 0.1*v(1) + 0.3*v(2) + 0.5*v(3);

for i= 2:31
    v = T*v;
    count1 = count1 + 0.1*v(1) + 0.3*v(2) + 0.5*v(3);
end

v = [0; 0; 1];
count2 = 0.1*v(1) + 0.3*v(2) + 0.5*v(3);

for i= 2:31
    v = T*v;
    count2 = count2 + 0.1*v(1) + 0.3*v(2) + 0.5*v(3);
end
fprintf('alinea f\n');
fprintf('dores reumaticas sol: %.2f\ndores reumaticas chuva: %.2f\n',count1, count2);
fprintf('\n');

