%palavra aleatória com letras 'a' 'm' 'o' 'r' '.'
%wordlistpreao20201103
fid = fopen('wordlist-preao-20201103.txt','r');
dicionario = textscan(fid, '%s');
fclose(fid);
dicionario = dicionario{1,1};

%alinea a

%   'a'    'm'  'o'  'r'  '.'
T = [0     0.5  0    0.5  0
     0.25  0    1/3  0    0
     0.25  0.5  0    0.5  0
     0.25  0    1/3  0    0
     0.25  0    1/3  0    1];

%gerar palavra aleatória com início no estado 1 e fim no 5
state = crawl(T, 1, 5);
stateNames = ["a" "m" "o" "r" ""];
len = length(state);
wordArr = string(zeros(1,len));
%converter estados em caracteres
for i=1:len
    wordArr(i) = stateNames(state(i));
end
%juntar caracteres numa palavra
word = join(wordArr);
 
 
%alinea b

N = 1e5;
stateNames = ["a" "m" "o" "r" ""];
wordlist = string(zeros(N,1));
%preencher wordlist com palavras geradas
for i=1:N
    state = crawl(T, 1, 5);
    len = length(state);
    wordArr = string(zeros(1,len));
    for j=1:len
        wordArr(j) = stateNames(state(j));
    end
    word = join(wordArr);
    wordlist(i) = word;
end

countDif = 0;
difwords = string(zeros(N,1));
for i=1:N
    %se word não está na lista de palavras diferentes
    if ismember(wordlist(i),difwords)==0
        %adiciona palavra
        difwords(i) = wordlist(i);
        %conta número de palavras diferentes
        countDif = countDif + 1;
    end
end

numPalavrasDif = countDif

%5 palavras com probabilidades mais altas







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

