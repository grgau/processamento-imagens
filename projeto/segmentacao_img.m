%Ex. de uso:    segmentacao_img('lena.jpg', 5)
%               segmentacao_img('rgb.jpg', 7)


function segmentacao_img(imagem)
    %Funcao que define quantidade de centroides baseado em picos no histograma da imagem    
    num_clusters = num_clusters_func(imagem);
    
    
    imagem = imread(imagem);            % Le imagem
    imagem_cinza = rgb2gray(imagem);    % Converte imagem para formato lab
    %imagem_cinza = imagem;                 %Caso a imagem seja em níveis de cinza, descomentar esta linha e comentar a linha acima.
    numlinhas = size(imagem_cinza,1);   % Armazena numero de linhas em variavel
    numcolunas = size(imagem_cinza,2);  % Armazena numero de colunas em variavel

    %Aplicamos o algoritmo de subtractive clustering.
    C = sub_clustering(num_clusters, imagem_cinza);
    disp(C);
    
    %Aplica o método k-means com os centroides iniciados pelo subtractive clustering
    fprintf("\n\nCom o subtractive clustering:\n");
    [index, centroide] = kmeans(double(imagem_cinza(:)), num_clusters, 'distance', 'sqEuclidean', 'Display', 'iter', 'Start', C); 
    disp(centroide);

    % Cria a imagem_segmentada1, atribuindo cores para cada um dos clusters gerados pelo kmeans
    imagem_segmentada1 = zeros(numlinhas, numcolunas);   % Inicializa uma imagem com zeros
    for i = 1:max(index)
        imagem_segmentada1(index == i) = centroide(i);   % Vetor imagem_segmentada, para index igual a i recebe valor de centroide de i 
    end
    
    
    %Aplica o método k-means com os centroides gerados pela função kmeans.
    fprintf('\n\n\nSem o Subtractive Clustering, com 10 repetições:\n');
    [index, centroide] = kmeans(double(imagem_cinza(:)), num_clusters, 'distance', 'sqEuclidean', 'Display', 'iter', 'Replicates', 10);
   
    % Cria a imagem_segmentada2, atribuindo cores para cada um dos clusters gerados pelo kmeans
    imagem_segmentada2 = zeros(numlinhas, numcolunas);   % Inicializa uma imagem com zeros
    for i = 1:max(index)
        imagem_segmentada2(index == i) = centroide(i);   % Vetor imagem_segmentada, para index igual a i recebe valor de centroide de i 
    end
    
    %Exibe ambas as imagens, sendo a da esquerda com os centroides do subtractive clustering e a da direita com os centroides gerados.
    imagesc([imagem_segmentada1, imagem_segmentada2])          % Exibe a imagem atribuindo cores para cada um dos clusters
end