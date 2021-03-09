%alinea a
p=0.4;
q=0.6;
%    A        B C D
T = [p^2      0 0 q^2
    (1-p)^2   0 0 q*(1-q)
     p*(1-p)  0 0 q*(1-q)
     p*(1-p)  1 1 (1-q)^2];
 
 sum(T);


%alinea b
%ao fim de 5 transições
x = [1
     0
     0
     0];
v = T^5 * x;

fprintf('5 iter: p(A)=%.8f p(B)=%.8f p(C)=%.8f p(D)=%.8f\n',v);
fprintf('10 iter: p(A)=%.8f p(B)=%.8f p(C)=%.8f p(D)=%.8f\n',T^10 * x);
fprintf('100 iter: p(A)=%.8f p(B)=%.8f p(C)=%.8f p(D)=%.8f\n',T^100 * x);
fprintf('200 iter: p(A)=%.8f p(B)=%.8f p(C)=%.8f p(D)=%.8f\n',T^200 * x);

%alinea c
%probabilidades limite de cada estado
%eye - matriz identidade

M = [T - eye(4); ones(1,4)];

x = [zeros(4,1);1];

v = M\x;

fprintf('prob limite: p(A)=%.8f p(B)=%.8f p(C)=%.8f p(D)=%.8f\n',v);
 
 