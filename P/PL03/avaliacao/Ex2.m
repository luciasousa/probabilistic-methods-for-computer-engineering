fid = fopen('wordlist-preao-20201103.txt','r');
dicionario = textscan(fid, '%s');
fclose(fid);
dicionario = dicionario{1,1};

%alinea a

%   'a'    'm'  'o'  'r'  '.'
T = [0     0.7  0    0.7  0
     0.2   0    0.2  0    0
     0.1   0.3  0    0.3  0
     0.3   0    0.3  0    0
     0.4   0    0.5  0    1];

%gerar palavra aleatória com início no estado 1 e fim no 5
%selecionar a primeira letra aleatoriamente
firstState = randi([1 4],1);
set_of_letters = 'amor.';
state = crawl(T, firstState, 5);
word = set_of_letters(state);
word = erase(word,'.');

%alinea b

N = 1e5;
wordlist = {};
contador = ones(20000,1); %array a 1's para contar palavras
%preencher wordlist com todas as palavras diferentes geradas
for i=1:N
    %gerar palavra
    firstState = randi([1 4],1);
    state = crawl(T, firstState, 5);
    word = set_of_letters(state);
    word = erase(word,'.');
    %verificar se palavra não existe na wordlist
    if ismember(word,wordlist)==0
        %adiciona palavra
        wordlist{end+1} = word;
    %se pertence à wordlist
    else %ismember(word,wordlist)==1
        %incrementar elemento do contador 
        %na mesma posição da palavra na wordlist
        %contador(posição da palavra na lista) + 1
        idx = find(ismember(wordlist,word));
        contador(idx) = contador(idx) + 1;
    end
end
numPalavrasDiferentes = length(wordlist);



%5 maiores valores no array contador
numPalavrasMaisGeradas = maxk(contador,5);
palavrasMaisGeradas = {};
for j=1:5
    %preencher cell array com as palavras mais geradas a partir do array contador
    palavrasMaisGeradas{end+1} = wordlist{1,find(contador==numPalavrasMaisGeradas(j))};
end
%probabilidade de cada palavra dessas 5
probPalavras = numPalavrasMaisGeradas/N

%alinea c


%'o' 'a' 'ro' 'mo' 'ma'
%probabilidade de 'o.' começar em 'o' e o estado seguinte ser '.'
p1 = 0.25 * T(5,3);
%probabilidade de 'a.'
p2 = 0.25 * T(5,1);
%probabilidade de 'ro.'
p3 = 0.25 * T(3,4) * T(5,3);
%probabilidade de 'mo.'
p4 = 0.25 * T(3,2) * T(5,3);
%probabilidade de 'ma.'
p5 = 0.25 * T(1,2) * T(5,1);

%alinea d
palavrasValidas = 0;
%percorrer lista das palavras geradas
for k=1:numPalavrasDiferentes
    %se palavra gerada pertencer ao dicionário
    if ismember(wordlist{1,k},dicionario)==1
        %incrementa contador de palavras válidas
        palavrasValidas = palavrasValidas + 1;
    end
end
%cálculo da probabilidade
probValid = palavrasValidas/numPalavrasDiferentes

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%FUNCTIONS

function state = crawl(H, first, last)
    state = [first];
    while (1)
        state(end+1) = nextState(H, state(end));
        if (state(end) == last)
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

