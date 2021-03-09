%carregar todos os dados necessários
load users.mat
load movies.mat
load shinglesMovies.mat
load minHash.mat
%load minHashUsers.mat
%pedir o ID ao utilizador e valida-lo
id = input('Insert User ID (1 to 943): ');
while id<1 || id>943
    fprintf("\nUser ID must be between 1 and 943!\n");
    id = input('Insert User ID (1 to 943): ');
end

%apresentar o menu
prompt = '\n1 - Your Movies\n2 - Get Suggestions\n3 - Search Title\n4 - Exit\nSelect Choice: ';
option = input(prompt);

%termina se a opção for 4
while option ~= 4
    switch option
        case 1
            %apresenta os filmes do ID introduzido
            fprintf("\nUser %d wathched the following movies:\n\n",id);
            for m=1:length(Set{id,1})
                fprintf("%s\n",dic{Set{id,1}(m),1});
            end
            pause()
            clc
            option = input(prompt);
        case 2
            %pedir o género e validar
            message = "\n1- Action, 2- Adventure, 3- Animation, 4- Children's\n5- Comedy, 6- Crime, 7- Documentary, 8- Drama\n9- Fantasy, 10- Film-Noir, 11- Horror, 12- Musical\n13- Mystery, 14- Romance, 15- Sci-Fi, 16- Thriller\n17- War, 18- Western\nSelect choice: ";
            genre = input(message);
            while genre<1 || genre>18
                fprintf("\nInvalid choice!\n");
                genre = input(message);
            end
            
            minHashID = MinHashID(Set,K,id);
            %remover id dos users
            Nu=943-1;
            users(users==id)=[];
            K=50;
            minHashUsers = MinHashUsers(Set,Nu,K);
            
            %distancia entre id e os users
            J2=zeros(Nu,1);
            for n1= 1:Nu
                J2(n1,1) = sum(minHashUsers(n1,:)~=minHashID(1,:))/K;
            end
            
            %procurar o user mais similar
            threshold =0.4;
            SimilarUser= zeros(2,3);
            k= 1;
            for n1= 1:Nu
            	if J2(n1,1)<=0.4 && k==1
                    %if n1~=id
                        SimilarUser(k,:)= [users(n1) users(id) J2(n1,1)];
                        k= k+1;
                    %end
            	end
            end
            fprintf('A similar user to the ID is: %d\n',SimilarUser(1));
            
            %filmes do user id
            moviesUser=cell(length(Set{id,1}),1);
            for m=1:length(Set{id,1})
               moviesUser{m,1} = dic{Set{id,1}(m)};
            end
            
            %filmes do user similar
            moviesSim=cell(length(Set{SimilarUser(1),1}),1);
            for m=1:length(Set{SimilarUser(1),1})
               moviesSim{m,1} = dic{Set{SimilarUser(1),1}(m)};
            end
            
            %movies da categoria x e que user id nao viu
            moviesNotSeen = moviesSim;
            moviesNotSeen(ismember(moviesSim,moviesUser)) = [];
            moviesToDisplayToUser=cell(length(moviesNotSeen),1);
            
            for i=1:length(dic)
            	for j=1:length(moviesNotSeen)
                	if isequal(moviesNotSeen{j,1},dic{i,1})
                        %somar 2 ao genero para que dê certo com a
                        %informação do ficheiro
                        if dic{i,genre+2} == 1
                            moviesToDisplayToUser{j,1}=moviesNotSeen(j);
                        end
                	end
            	end
            end
            count = 0;
            %apresentar os filmes
            for i=1:length(moviesToDisplayToUser)
                if ~isempty(moviesToDisplayToUser{i,1})
                    moviesToDisplayToUser{i,1}
                    count = count + 1;
                end
            end
            if count == 0
            	fprintf('No suggestions\n');
            end
            %colocar id de volta nos users
            Nu=943;
            users(Nu)=id;
            pause()
            clc
            option = input(prompt);
            
        case 3
            str = input('Write a String: ','s');
            %calcular shingles da string
            shingles = Shingles(str,2);
            %calcular minhash da string
            minHashInput = MinHashValueInput(shingles,K);
            J=zeros(length(shinglesMovies),length(shingles));
            %calcular distâncias de Jaccard
            for n1= 1:length(shinglesMovies)
                for n2=1:length(shingles)
                    J(n1,n2) = sum(minHashInput(n2,:)~=minHash(n1,:))/K;
                end
            end
            threshold =0.99;
            SimilarMovies= cell(5,2);
            k= 1;
            %procurar os filmes mais semelhantes à string
            for n1= 1:length(shinglesMovies)
                for n2= 1:length(shingles)
                    if k<=5
                        if J(n1,n2)<=threshold
                            SimilarMovies(k,:)= {dic{n1},J(n1,n2)};
                            k= k+1;
                        end
                    end
                end
            end
            count = 0;
            %apresentar os filmes
            for i=1:length(SimilarMovies)
                if ~isempty(SimilarMovies{i,1})
                    count = count + 1;
                end
            end
            if count == 0
            	fprintf('Title not found!\n');
            else
                SimilarMovies
            end
            pause()
            clc
            option = input(prompt);
            
        otherwise
            fprintf("\nInvalid choice!\n");
            option = input(prompt);
    end
end

%função para calcular shingles de uma string
function shingles = Shingles(str,s)
    size_str = length(str);
    shingles=cell(1,size_str-s+1);
    for i=1:length(str)-s+1
        x = str(i:i+s-1);
    	shingles{1,i}= x;
    end
end

%função para calcular minHash
function minHashInput = MinHashValueInput(shingles,K)
    minHashInput=inf(length(shingles),K);
    for j=1:length(shingles)
    	chave = char(shingles(j));
    	hash=zeros(1,K);
        for kk=1:K
        	chave=[chave num2str(kk)];
        	hash(kk)=DJB31MA(chave,127);
        end
        minHashInput(j,:)=min([minHashInput(j,:);hash]);
    end
end

%minhash para o ID
function minHashID = MinHashID(Set,K,id)
    minHashID=inf(1,K);
    con=Set{id};
    for j=1:length(con)
        chave = char(con(j));
        hash=zeros(1,K);
        for kk=1:K
            chave=[chave num2str(kk)];
            hash(kk)=DJB31MA(chave,127);
        end
        minHashID(1,:)=min([minHashID(1,:);hash]);
    end
end

%minhash para os users
function minHashUsers = MinHashUsers(Set,Nu,K)
    minHashUsers=inf(Nu,K);
    for i=1:Nu  
        conjunto=Set{i};
        for j=1:length(conjunto)
        	chave = char(conjunto(j));
        	hash=zeros(1,K);
            for kk=1:K
            	chave=[chave num2str(kk)];
                hash(kk)=DJB31MA(chave,127);
            end
            minHashUsers(i,:)=min([minHashUsers(i,:);hash]);
        end
    end
end