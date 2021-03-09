udata=load('u.data'); %carrega ficheiro
u=udata(1:end,1:2); %fica com as 2 primeiras colunas User e Movie
clear udata;
% Lista de utilizadores
users = unique(u(:,1));     % Extrai os IDs dos utilizadores
Nu= length(users);          % Número de utilizadores
% Constrói a lista de filmes para cada utilizador
Set= cell(Nu,1);            % Usa células
for n = 1:Nu                % Para cada utilizador
    % Obtém os filmes de cada um
    ind = find(u(:,1) == users(n));
    % E guarda num array. Usa celulas porque utilizador tem um numero
    % diferente de filmes. Se fossem iguais podia ser um array
    Set{n} = [Set{n} u(ind,2)];
end
%guarda Set num ficheiro users.mat
save 'users.mat' Set
%lê o ficheiro u_item.txt
dic= readcell('u_item.txt');
save 'movies.mat' dic

%calcular 2-shingles dos movies
shinglesMovies = ShinglesMovies(dic,length(dic),2);
%guardar shingles dos movies
save 'shinglesMovies.mat' shinglesMovies
K=50;
%calcular minhash movies e guardar
minHash = MinHashValue(dic,shinglesMovies,K);
save 'minHash.mat' minHash



%função que retorna os shingles dos titulos dos filmes
function shinglesMovies = ShinglesMovies(dic,tamanho,s)
    shinglesMovies = cell(tamanho,1);
    for i=1:length(dic)
    	conjunto=dic{i};
    	arr=cell(1,length(conjunto)-s+1);
        for j=1:length(conjunto)-s+1
            x = conjunto(j:j+s-1);
        	arr{1,j}=x;
        end
        shinglesMovies{i,1}= arr;
    end       
end

%função que retorna o vetor MinHash de todos os títulos de filmes
function minHash = MinHashValue(dic,shingles,K)
    minHash=inf(length(shingles),K);
    for m=1:length(dic)
        for i=1:length(shingles(m))
            chave = char(shingles{m,1}(i));
            hash=zeros(1,K);
            for kk=1:K
                chave=[chave num2str(kk)];
                hash(kk)=DJB31MA(chave,127);
             end
         end
         minHash(m,:)=min([minHash(m,:);hash]);
    end
end






