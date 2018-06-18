% Essa funcao recebe a imagem hsi equalizada (canal i apenas) e duas imagens segmentadas como entrada, aplica o
% o calculo da dimensao fractal e retorna seu valor como saida.

function [valor_dim_fractal_hsi, valor_dim_fractal_seg_1, valor_dim_fractal_seg_2] = dimensao_fractal(imagem_hsi, imagem_seg_1, imagem_seg_2)
    % Nome das imagens que terão a dimensao fractal calculada
    [~, nome, extensao] = fileparts(imagem_hsi);
    [~, nome1, ~] = fileparts(imagem_seg_1);
    [~, nome2, extensao] = fileparts(imagem_seg_2);

    % Le imagens recebidas como entrada
    imagem_hsi = imread(imagem_hsi);
    imagem_seg_1 = imread(imagem_seg_1);
    imagem_seg_2 = imread(imagem_seg_2);

    
    % Calcular dimensao fractal
    valor_dim_fractal_hsi = conta_caixas(imagem_hsi);
    valor_dim_fractal_seg_1 = conta_caixas(imagem_seg_1);
    valor_dim_fractal_seg_2 = conta_caixas(imagem_seg_2);
    
    %fprintf("A dimensao fractal da imagem hsi foi %d, da segmentação 1 foi %d e da segmentação 2 foi %d!\n", valor_dim_fractal_hsi, valor_dim_fractal_seg_1, valor_dim_fractal_seg_2);
end

