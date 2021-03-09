%em média em 1000 chips 1 é def

%alinea a - distribuiçao binomial
%p de em 8000 chips 7 serem def
%N=1e5;
%exp = rand(8000,N)<=p;

p=1/1000;
pbin = nchoosek(8000,7)*p^(7)*(1-p)^(8000-7)

%alinea b - poisson
%lambda = 8000*p = 8
ppoi = (8^7)/(factorial(7)*exp(8))


