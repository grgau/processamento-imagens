% Essa funcao recebe duas imagens segmentadas como entrada, aplica um
% filtro morfologico nelas e as retorna como saida.

function [nome_imagem_filtro_1, nome_imagem_filtro_2] = filtro_morfologico(imagem_seg_1, imagem_seg_2)
    % Nome das imagens que ter�o o filtro morfologico aplicado
    [~, nome, extensao] = fileparts(imagem_seg_1, imagem_seg_2);

    % Le imagens recebidas como entrada
    imagem_seg_1 = imread(imagem_seg_1);
    imagem_seg_2 = imread(imagem_seg_2);
    
    
    % Aplicacao do filtro morfologico
    
    
    
    % Sobrescreve em disco as imagens segmentadas apos aplicacao do filtro
    nome_imagem_filtro_1 = strcat('imagens_seg/', nome, '_seg1', extensao);
    nome_imagem_filtro_2 = strcat('imagens_seg/', nome, '_seg2', extensao);
    
    imwrite(imagem_seg_1, nome_imagem_filtro_1);
    imwrite(imagem_seg_2, nome_imagem_filtro_2);
end

