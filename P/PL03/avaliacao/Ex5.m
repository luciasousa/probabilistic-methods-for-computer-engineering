fid = fopen('wordlist-preao-20201103.txt','r');
dicionario = textscan(fid, '%s');
fclose(fid);
dicionario = dicionario{1,1};

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

Ca_a = 0;
Ca_m = 0;
Ca_o = 0;
Ca_r = 0;
Ca_p = 0;
Cm_a = 0;
Cm_m = 0;
Cm_o = 0;
Cm_r = 0;
Cm_p = 0;
Co_a = 0;
Co_m = 0;
Co_o = 0;
Co_r = 0;
Co_p = 0;
Cr_a = 0;
Cr_m = 0;
Cr_o = 0;
Cr_r = 0;
Cr_p = 0;

%por cada palavra na lista
for j=1:length(listaPalavrasDict)
    w = listaPalavrasDict{j};
    %ver letra na posição i e na posição seguinte
    for i=1:(length(w)-1)
        state = w(i);
        next = w(i+1);
        %incrementar contadores respetivos às transições
        if state == 'a'
            if next == 'a'
                Ca_a = Ca_a + 1;
            end
            if next == 'm'
                Ca_m = Ca_m + 1;
            end
            if next == 'o'
                Ca_o = Ca_o + 1;
            end
            if next == 'r'
                Ca_r = Ca_r + 1;
            end
            if (i+1) == length(w)
                Ca_p = Ca_p + 1;
            end
        end 
        if state == 'm'
            if next == 'a'
                Cm_a = Cm_a + 1;
            end
            if next == 'm'
                Cm_m = Cm_m + 1;
            end
            if next == 'o'
                Cm_o = Cm_o + 1;
            end
            if next == 'r'
                Cm_r = Cm_r + 1;
            end
            if (i+1) == length(w)
                Cm_p = Cm_p + 1;
            end
        end 
        if state == 'o'
            if next == 'a'
                Co_a = Co_a + 1;
            end
            if next == 'm'
                Co_m = Co_m + 1;
            end
            if next == 'o'
                Co_o = Co_o + 1;
            end
            if next == 'r'
                Co_r = Co_r + 1;
            end
            if (i+1) == length(w)
                Co_p = Co_p + 1;
            end
        end 
        if state == 'r'
            if next == 'a'
                Cr_a = Cr_a + 1;
            end
            if next == 'm'
                Cr_m = Cr_m + 1;
            end
            if next == 'o'
                Cr_o = Cr_o + 1;
            end
            if next == 'r'
                Cr_r = Cr_r + 1;
            end
            if (i+1) == length(w)
                Cr_p = Cr_p + 1;
            end
        end 
    end
end

%probabilidades de transição
Pa_a = Ca_a/(Ca_a+Ca_m+Ca_o+Ca_r+Ca_p);
Pa_m = Ca_m/(Ca_a+Ca_m+Ca_o+Ca_r+Ca_p);
Pa_o = Ca_o/(Ca_a+Ca_m+Ca_o+Ca_r+Ca_p);
Pa_r = Ca_r/(Ca_a+Ca_m+Ca_o+Ca_r+Ca_p);
Pa_p = Ca_p/(Ca_a+Ca_m+Ca_o+Ca_r+Ca_p);
Pm_a = Cm_a/(Cm_a+Cm_m+Cm_o+Cm_r+Cm_p);
Pm_m = Cm_m/(Cm_a+Cm_m+Cm_o+Cm_r+Cm_p);
Pm_o = Cm_o/(Cm_a+Cm_m+Cm_o+Cm_r+Cm_p);
Pm_r = Cm_r/(Cm_a+Cm_m+Cm_o+Cm_r+Cm_p);
Pm_p = Cm_p/(Cm_a+Cm_m+Cm_o+Cm_r+Cm_p);
Po_a = Co_a/(Co_a+Co_m+Co_o+Co_r+Co_p);
Po_m = Co_m/(Co_a+Co_m+Co_o+Co_r+Co_p);
Po_o = Co_o/(Co_a+Co_m+Co_o+Co_r+Co_p);
Po_r = Co_r/(Co_a+Co_m+Co_o+Co_r+Co_p);
Po_p = Co_p/(Co_a+Co_m+Co_o+Co_r+Co_p);
Pr_a = Cr_a/(Cr_a+Cr_m+Cr_o+Cr_r+Cr_p);
Pr_m = Cr_m/(Cr_a+Cr_m+Cr_o+Cr_r+Cr_p);
Pr_o = Cr_o/(Cr_a+Cr_m+Cr_o+Cr_r+Cr_p);
Pr_r = Cr_r/(Cr_a+Cr_m+Cr_o+Cr_r+Cr_p);
Pr_p = Cr_p/(Cr_a+Cr_m+Cr_o+Cr_r+Cr_p);
 
%    'a'    'm'   'o'   'r'  '.'
T = [Pa_a   Pm_a  Po_a  Pr_a  0
     Pa_m   Pm_m  Po_m  Pr_m  0
     Pa_o   Pm_o  Po_o  Pr_o  0
     Pa_r   Pm_r  Po_r  Pr_r  0
     Pa_p   Pm_p  Po_p  Pr_p  1]
 
sum(T)
 
 
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
numPalavrasDiferentes = length(wordlist)



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

