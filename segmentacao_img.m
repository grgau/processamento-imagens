%Ex. de uso:    segmentacao_img('lena.jpg', 5)
%               segmentacao_img('rgb.jpg', 7)

function segmentacao_img(imagem, num_clusters)
    imagem = imread(imagem);            % Le imagem
    imagem_cinza = rgb2gray(imagem);    % Converte imagem para formato lab
    numlinhas = size(imagem_cinza,1);   % Armazena numero de linhas em variavel
    numcolunas = size(imagem_cinza,2);  % Armazena numero de colunas em variavel

    % Aplica algoritmo kmeans percorrendo a imagem guardando um vetor de index e centroides
    % Parametros: imagem, quantidade de clusters da segmenta��o, 'distance' e 'sqEuclidean' definem o tipo de distancia a ser usada, 'Replicates' e valor seguinte definem quantas execu��es do kmeans ser�o realizadas
    [index, centroide] = kmeans(double(imagem_cinza(:)), num_clusters, 'distance', 'sqEuclidean', 'Replicates', 5);

    % Cria uma imagem segmentada, atribuindo cores para cada um dos clusters gerados pelo kmeans
    imagem_segmentada = zeros(numlinhas, numcolunas);   % Inicializa uma imagem com zeros
    for i = 1:max(index)
        imagem_segmentada(index == i) = centroide(i);   % Vetor imagem_segmentada, para index igual a i recebe valor de centroide de i 
    end
    imagesc(imagem_segmentada)          % Exibe a imagem atribuindo cores para cada um dos clusters
end