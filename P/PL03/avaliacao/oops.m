fid = fopen('wordlist-preao-20201103.txt','r');
dicionario = textscan(fid, '%s');
fclose(fid);
dicionario = dicionario{1,1};

%   'a'    'm'  'o'  'r'  '.'
T = [    0    0.5682    0.0455    0.7273         0
    0.6364    0.0114    0.0682    0.0682         0
    0.0114    0.2500    0.0227    0.1932         0
    0.8750         0    0.2045    0.1705         0
    0.4318    0.1705    0.0682    0.3068    1.0000];

sum(T)

%usando o dicionário estimar a prob de cada letra ser a primeira
countA = 0;
countM = 0;
countO = 0;
countR = 0;
for j=1:994898
    word = dicionario{j};
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

probA = countA/994898;
probM = countM/994898;
probO = countO/994898;
probR = countR/994898;
probPonto = 0;
 
N = 1e5;
set_of_letters = 'amor.';
vetorProb = [probA; probM; probO; probR];
wordlist = {};
contador = ones(20000,1); %array a 1's para contar palavras
%preencher wordlist com todas as palavras diferentes geradas
for i=1:N
    %gerar palavra
    firstState = discrete_rnd(1:N,vetorProb);
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
probPalavras = numPalavrasMaisGeradas/N;

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
probValid = palavrasValidas/N;

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

