% Essa funcao recebe duas imagens segmentadas como entrada, aplica um
% filtro morfologico (filtro gaussiano) nelas e as retorna como saida.

function [] = filtro_morfologico(imagem_seg_1, imagem_seg_2)
    % Nome das imagens que terão o filtro morfologico aplicado
    [~, nome1, ~] = fileparts(imagem_seg_1);
    [~, nome2, extensao] = fileparts(imagem_seg_2);

    % Le imagens recebidas como entrada
    imagem_seg_1 = imread(imagem_seg_1);
    imagem_seg_2 = imread(imagem_seg_2);
    
    % Normaliza as imagens, necessario para aplicar-se o filtro
    imagem_seg_1 = im2double(imagem_seg_1);
    imagem_seg_2 = im2double(imagem_seg_2);
    
    % Pega os tamanhos de cada imagem
    [m1,n1] = size(imagem_seg_1);
    [m2,n2] = size(imagem_seg_2);
    
    % Cria imagens vazias com exatamente mesmo tamanho das originais sem filtro
    imagem_filtrada_1 = zeros(m1,n1);
    imagem_filtrada_2 = zeros(m2,n2);
    
    % Inicio de filtragem por filtro Gaussiano
    tamanho_mascara = 3;    % Tamanho da mascara do filtro gaussiano (SO ESTA FUNCIONANDO COM VALOR 3 (ver linha 44))
    sigma = 3;              % Define valor arbitrario do sigma

    % Gerando mascara Gaussiana
    indice = floor(tamanho_mascara/2);
    X = [-indice 0 indice; -indice 0 indice; -indice 0 indice];
    Y = [-indice -indice -indice; 0 0 0; indice indice indice];
    
    coeficientes = exp(-(X.^2 + Y.^2) / (2*sigma*sigma));  % Equacao que descreve o filtro Gaussiano
    coeficientes = coeficientes / sum(coeficientes(:));    % Calcula-se valor final dos coeficientes (razao dos valores calculados pela equacao do filtro de Gauss dividido pela soma de todos os valores)
    
    % Variaveis que definem onde comeca a aplicar a mascara (Neste caso, pixel(1,1) das imagens
    inicioX = tamanho_mascara - indice;
    inicioY = tamanho_mascara - indice;
    
    % Aplicando o filtro para imagem segmentada 1
    for i = inicioX : m1-inicioX
        for j = inicioY : n1-inicioY
            janela_mascara = [imagem_seg_1(i-1,j-1) imagem_seg_1(i-1,j) imagem_seg_1(i-1,j+1); imagem_seg_1(i,j-1) imagem_seg_1(i,j) imagem_seg_1(i,j+1); imagem_seg_1(i+1,j-1) imagem_seg_1(i+1,j) imagem_seg_1(i+1,j+1)];
            multiplicacao = coeficientes.*janela_mascara;
            imagem_filtrada_1(i,j) = sum(multiplicacao(:));
        end
    end
    
    % Aplicando o filtro para imagem segmentada 2
    for i = inicioX : m2-inicioX
        for j = inicioY : n2-inicioY
            janela_mascara = [imagem_seg_2(i-1,j-1) imagem_seg_2(i-1,j) imagem_seg_2(i-1,j+1); imagem_seg_2(i,j-1) imagem_seg_2(i,j) imagem_seg_2(i,j+1); imagem_seg_2(i+1,j-1) imagem_seg_2(i+1,j) imagem_seg_2(i+1,j+1)];
            multiplicacao = coeficientes.*janela_mascara;
            imagem_filtrada_2(i,j) = sum(multiplicacao(:));
        end
    end
           
    % Sobrescreve em disco as imagens segmentadas apos aplicacao do filtro
    nome_imagem_filtro_1 = strcat('imagens_seg/', nome1, extensao);
    nome_imagem_filtro_2 = strcat('imagens_seg/', nome2, extensao);
    imwrite(imagem_filtrada_1, nome_imagem_filtro_1);
    imwrite(imagem_filtrada_2, nome_imagem_filtro_2);
end

