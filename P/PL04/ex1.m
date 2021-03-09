N = 1e5;
alpha = ['a':'z' 'A':'Z'];

tic
keys = generator(N,6,20,alpha);
fprintf('1a) No keys: %d\n', length(keys));
fprintf('    No unique: %d\n', length(unique(keys)));
fprintf('    Running Time: %f seconds\n', toc);
save 'keys' 'keys'
%salva keys num ficheiro keys.mat
%clear all
%load keys --> manda as keys para as variáveis outra vez

%alinea b
alphaB = ['a':'z'];
tic
probs = load('prob_pt.txt');
keysB = generator(N,6,20,alphaB,probs);
fprintf('1b) No keys: %d\n', length(keysB));
fprintf('    No unique: %d\n', length(unique(keysB)));
fprintf('    Running Time: %f seconds\n', toc);
save 'keysB' 'keysB' 

%  implementar generator  %
function keys = generator(N,imin,imax,vchar,vprob)
    keys = {}
    n = 0; %num de chaves que estão no cell array
    Nvchar = length(vchar);
    if nargin==5
        cs = cumsum(vprob);
    end
    while n<N
        %gerar tamanho da chave
        tam = randi([imin, imax]);
        %escolher caracteres
        if nargin==4 %caracteres equiprováveis
            aux = randi(Nvchar,1,tam); %1 linha, tam colunas, cada valor é um numero interio aleatorio entre 1 e lenght vchar
        else
            aux=zeros(1,tam);
            for i=1:tam
                aux(i) = 1+sum(rand()>cs);
            end
        end
        %vai buscar caracteres ao vchar
        key = vchar(aux);
        %pause()
        %se não estiver no cell array acrescenta chave
        if ~ismember(key,keys)
            n = n+1;
            keys{n} = key;
        end
    end
end

function state = crawl(H, first, last, limit)
    state = [first];
    while (1)
        state(end+1) = nextState(H, state(end));
        if (state(end) == last)
            break;
        end
        if  length(state)==limit
            break;
        end
    end
end
function state = nextState(H, currentState)
    probVector = H(:,currentState)'; 
    n = length(probVector);
    state = discrete_rnd(1:n, probVector);
end
function state = discrete_rnd(states, probVector)
    U=rand();
    i = 1 + sum(U > cumsum(probVector));
    state= states(i);
end

