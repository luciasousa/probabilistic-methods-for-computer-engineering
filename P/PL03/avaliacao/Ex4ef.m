fid = fopen('wordlist-preao-20201103.txt','r');
dicionario = textscan(fid, '%s');
fclose(fid);
dicionario = dicionario{1,1};

%alinea e) e f)

%   'a'    'm'  'o'  'r'  '.'
T = [0     0.7  0    0.6  0
     0.2   0    0.2  0.1  0
     0.1   0.3  0    0.3  0
     0.3   0    0.3  0    0
     0.4   0    0.5  0    1];

%palavras do dicionário com as letras 'a' 'm' 'o' 'r'
listaPalavrasDict = {};
%letras possíveis
validLetter = ['a' 'm' 'o' 'r'];
for w=1:994898
    pal = dicionario{w};
    flag = 1;
    %verificar se palavra não tem letras diferentes das pedidas
    for i=1:length(pal)
        letter=pal(i);
        %se não tiver as letras esperadas
        if ismember(letter,validLetter)==0
            %é atribuído o valor zero à variável flag
            flag = 0;
        end
    end
    %se as letras na palavra pertencerem a validLetter
    if flag == 1
        %adiciona palavra à lista
        listaPalavrasDict{end+1} = pal;
    end
end

%usando o dicionário estimar a prob de cada letra ser a primeira
countA = 0;
countM = 0;
countO = 0;
countR = 0;
for j=1:length(listaPalavrasDict)
    word = listaPalavrasDict{j};
    if word(1) == 'a'
        countA = countA + 1;
    end
    if word(1) == 'm'
        countM = countM + 1;
    end
    if word(1) == 'o'
        countO = countO + 1;
    end
    if word(1) == 'r'
        countR = countR + 1;
    end
end

probA = countA/length(listaPalavrasDict)
probM = countM/length(listaPalavrasDict)
probO = countO/length(listaPalavrasDict)
probR = countR/length(listaPalavrasDict)
probPonto = 0;
vetorProb = [probA; probM; probO; probR];
n = 4;            %limit
set_of_letters = 'amor.';
N = 1e5;
wordlist = {};
contador = ones(18445,1);
%preencher wordlist com todas as palavras diferentes geradas
for i=1:N
    firstState = discrete_rnd(1:N,vetorProb);
    state = crawl(T, firstState, 5, n);
    word = set_of_letters(state);
    word = erase(word,'.');
    %se não é membro
    if ismember(word,wordlist)==0
        %adiciona palavra
        wordlist{end+1} = word;
    %se pertence à lista
    else %ismember(word,wordlist)==1
        %posição da palavra na lista -> posição no contador + 1
        idx = find(ismember(wordlist,word));
        contador(idx) = contador(idx) + 1;
    end
end
numPalavrasDifrentes = length(wordlist)
numPalavrasMaisGeradas = maxk(contador,5);
palavrasMaisGeradas = {};
for j=1:5
    palavrasMaisGeradas{end+1} = wordlist{1,find(contador==numPalavrasMaisGeradas(j))};
end
probPalavras = numPalavrasMaisGeradas/N

palavrasValidas = 0;
for k=1:numPalavrasDifrentes
    if ismember(wordlist{1,k},dicionario)==1
        palavrasValidas = palavrasValidas + 1;
    end
end

nvalid = palavrasValidas/numPalavrasDifrentes

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%FUNCTIONS

function state = crawl(H, first, last, limit)
    state = [first];
    while (1)
        state(end+1) = nextState(H, state(end));
        if (state(end) == last) || length(state)==limit
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

