% Essa funcao recebe uma imagem HSI (canal I apenas) como entrada, realiza
% a segmentacao em duas imagens usando algoritmo k-means (com k=2) e cria as duas
% imagens segmentadas no diretorio 'imagens_seg'.

function [nome_imagem_seg_1, nome_imagem_seg_2] = segmentacao(imagem_hsi)
    % Nome das imagens que serão usados para gerar imagens segmentadas
    [~, nome, extensao] = fileparts(imagem_hsi);
    
    % Le a imagem HSI a ser segmentada
    imagem_hsi = imread(imagem_hsi);

    % Cria as imagens vazias segmentadas com respectivos nomes em 'imagens_seg'
    imagem_seg_1 = zeros(size(imagem_hsi));
    imagem_seg_2 = zeros(size(imagem_hsi));

    %  Define quantidade de clusters e aplica algoritmo de segmentação k-means
    num_clusters = 2;
    [index, centroide] = kmeans(double(imagem_hsi(:)), num_clusters, 'distance', 'sqEuclidean', 'Replicates', 3);
    
    % Os index correspondentes ao centroide 1 serão atribuidos para imagem_seg_1
    % Os index correspondentes ao centroide 2 serão atribuidos para imagem_seg_2
    for i = 1:max(index)
        imagem_seg_1(index == 1) = centroide(1);
        imagem_seg_2(index == 2) = centroide(2);
    end
    
    % Cria as imagens com os nomes respectivos as imagens hsi de origem + '_seg1' e '_seg2'
    nome_imagem_seg_1 = strcat('imagens_seg/', nome, '_seg1', extensao);
    nome_imagem_seg_2 = strcat('imagens_seg/', nome, '_seg2', extensao);
    
    imwrite(imagem_seg_1, nome_imagem_seg_1);
    imwrite(imagem_seg_2, nome_imagem_seg_2);
end