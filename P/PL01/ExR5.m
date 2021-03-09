n = 20;  %20 cartas

experiencia = randi([0 1],1,20)
m1 = [0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1];
m2 = [1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0];
altern = or(experiencia==m1, experiencia==m2);
prob = sum(altern)/factorial(20)