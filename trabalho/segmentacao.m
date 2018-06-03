% Essa funcao recebe uma imagem HSI (canal I apenas) como entrada, realiza
% a segmentacao em duas imagens usando algoritmo k-means (com k=2) e cria as duas
% imagens segmentadas no diretorio 'imagens_seg'.

function [nome_imagem_seg_1, nome_imagem_seg_2, nome_imagem_seg_3] = segmentacao(imagem_hsi)
    % Nome das imagens que serão usados para gerar imagens segmentadas
    [~, nome, extensao] = fileparts(imagem_hsi);
    
    % Le a imagem HSI a ser segmentada
    imagem_hsi = imread(imagem_hsi);

    % Cria as imagens vazias segmentadas com respectivos nomes em 'imagens_seg'
    imagem_seg_1 = zeros(size(imagem_hsi));
    imagem_seg_2 = zeros(size(imagem_hsi));
    imagem_seg_3 = zeros(size(imagem_hsi));

    %  Define quantidade de clusters e aplica algoritmo de segmentação k-means
    num_clusters = 3;
    [index, centroide] = kmeans(double(imagem_hsi(:)), num_clusters, 'distance', 'sqEuclidean', 'Replicates', 3);
    
    % Os index correspondentes ao centroide 1 serão atribuidos para imagem_seg_1
    % Os index correspondentes ao centroide 2 serão atribuidos para imagem_seg_2
    for i = 1:max(index)
        imagem_seg_1(index == 1) = centroide(1);
        imagem_seg_2(index == 2) = centroide(2);
        imagem_seg_3(index == 3) = centroide(3);
    end
    
    %Usa a segmentação como máscara, copiando o nível de cinza para as
    %casas ocupadas.
    for i=1:size(imagem_hsi,1)
        for j=1:size(imagem_hsi,2)
            if( imagem_seg_1(i,j) ~= 0)
                imagem_seg_1(i,j) = imagem_hsi(i,j);
            else
                imagem_seg_1(i,j) = 255;
            end 
            if( imagem_seg_2(i,j) ~= 0)
                imagem_seg_2(i,j) = imagem_hsi(i,j);
            else
                imagem_seg_2(i,j) = 255;
            end
            if( imagem_seg_3(i,j) ~= 0)
                imagem_seg_3(i,j) = imagem_hsi(i,j);
            else
                imagem_seg_3(i,j) = 255;
            end
        end
    end
    
    %Normaliza para imprimir no imwrite tudo bonitinho
    imagem_seg_1 = double(imagem_seg_1) - double(min(imagem_seg_1(:)));
    imagem_seg_1 = double(imagem_seg_1)/double(max(imagem_seg_1(:)));
    
    imagem_seg_2 = double(imagem_seg_2) - double(min(imagem_seg_2(:)));
    imagem_seg_2 = double(imagem_seg_2)/double(max(imagem_seg_2(:)));
    
    imagem_seg_3 = double(imagem_seg_3) - double(min(imagem_seg_3(:)));
    imagem_seg_3 = double(imagem_seg_3)/double(max(imagem_seg_3(:)));
    
    % Cria as imagens com os nomes respectivos as imagens hsi de origem + '_seg1' e '_seg2'
    nome_imagem_seg_1 = strcat('imagens_seg/', nome, '_seg1', extensao);
    nome_imagem_seg_2 = strcat('imagens_seg/', nome, '_seg2', extensao);
    nome_imagem_seg_3 = strcat('imagens_seg/', nome, '_seg3', extensao);
    nome_imagem_teste = strcat('imagens_seg/', nome, '_teste', extensao);
    
    imwrite(imagem_seg_1, nome_imagem_seg_1);
    imwrite(imagem_seg_2, nome_imagem_seg_2);
    imwrite(imagem_seg_3, nome_imagem_seg_3);
    imwrite(imagem_hsi, nome_imagem_teste);
end