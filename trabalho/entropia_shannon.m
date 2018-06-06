% Essa funcao recebe a imagem hsi equalizada (canal i apenas) e duas imagens segmentadas como entrada, aplica o
% o calculo da entropia de shannon e retorna seu valor como saida.

function [valor_entropia_sh_hsi, valor_entropia_sh_seg_1, valor_entropia_sh_seg_2] = entropia_shannon(imagem_hsi, imagem_seg_1, imagem_seg_2)
    % Nome das imagens que terão a entropia de shannon calculada
    [~, nome, extensao] = fileparts(imagem_hsi);
    [~, nome1, ~] = fileparts(imagem_seg_1);
    [~, nome2, extensao] = fileparts(imagem_seg_2);

    % Le imagens recebidas como entrada
    imagem_hsi = imread(imagem_hsi);
    imagem_seg_1 = imread(imagem_seg_1);
    imagem_seg_2 = imread(imagem_seg_2);

    
    % Calcular entropia de shannon
    

end

