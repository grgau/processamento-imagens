function num_clusters = num_clusters_func(imagem)
    
    imagem = imread(imagem);   % Le imagem
    linhas = size(imagem,1);   % Armazena numero de linhas em variavel
    colunas = size(imagem,2);  % Armazena numero de colunas em variavel
    
    % Zera o vetor do histograma
    for k = 1:256
        h(k) = 0; 
    end

    % Cria o histograma
    for i = 1:linhas
        for j = 1:colunas
            ind = double(imagem(i,j))+1;
            h(ind) = h(ind) + 1;
        end
    end

    % Histograma da imagem
    %figure;
    %bar(h);

    % Conta quantidade de picos na imagem e atribui para num_clusters
    [~, x] = findpeaks(h,'MinPeakHeight', 0.5, 'MinPeakDistance', 20); % Pega os picos com altura acima de 50% em relação a intensidade vizinha e picos distantes um do outro em pelo menos 20 intensidades
    [~, num_clusters] = size(x);
end