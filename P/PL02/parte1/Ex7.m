%alinea a
%Andre -- 0.20 -- 0.01
%Bruno -- 0.30 -- 0.05
%Carlos - 0.50 -- 0.001

%P(C|E) = 0.0005/0.0175 = 0.0285
%P(C e E) = 0.0005
%P(E) = P(E|A)*P(A)+P(E|B)*P(B)+P(E|C)*P(C)
%P(E) = 0.0175

N = 1e7;
%0 sem erro, 1 tem erro
andre = rand(20,N) < 0.01;
bruno = rand(30,N) < 0.05;
carlos = rand(50,N) < 0.001;

prog = [andre; bruno; carlos];
count = 0;
c=0;

for i=1:N
    if prog(i)==1
        c = c + 1;
        for carl=50:100
            x = prog(carl,:);
            if x(i)==1
                count = count + 1;
            end
        end
    end
end

probErro = c/N
pec = count/N
p = pec/pe

%resoluçao do professor
tic
experiencias = [rand(20,N)<0.01;rand(30,N)<0.05;rand(50,N)<0.001];
countEC = 0;
countE = 0;
for i=1:N
    aux = randi(100);
    if experiencia(aux,i)==true
        countE = countE + 1;
        if aux>=50
            countEC = countEC + 1;
        end
    end
end
probCarlosErro1 = countEC/countE
toc

%resoluçao mais eficiente
tic
countEC = 0;
countE = 0;
for i=1:N
    aux = randi(100);
    if aux > 50
        a = rand()<0.001;
    elseif aux <=20
        a=rand()<0.01;
    else
        a=rand()<0.05;
    end
    if a==true
        countE = countE + 1;
        if aux>=50
            countEC = countEC + 1;
        end
    end
end
probCarlosErro2 = countEC/countE
toc

%alinea b
%P(A|E) = 0.11
%P(B|E) = 0.85
% mais provável o programa ser do Bruno