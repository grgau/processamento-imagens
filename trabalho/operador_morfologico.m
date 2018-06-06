% Essa funcao recebe a imagem hsi equalizada (canal i apenas) e duas imagens segmentadas como entrada, aplica o
% o operador morfologico escolhido (______________) e retorna seu valor como saida.

function [valor_op_morfologico_hsi, valor_op_morfologico_seg_1, valor_op_morfologico_seg_2] = operador_morfologico(imagem_hsi, imagem_seg_1, imagem_seg_2)
    % Nome das imagens que terão o operador morfologico calculado
    [~, nome, extensao] = fileparts(imagem_hsi);
    [~, nome1, ~] = fileparts(imagem_seg_1);
    [~, nome2, extensao] = fileparts(imagem_seg_2);

    % Le imagens recebidas como entrada
    imagem_hsi = imread(imagem_hsi);
    imagem_seg_1 = imread(imagem_seg_1);
    imagem_seg_2 = imread(imagem_seg_2);

    
    % Calcular operador morfologico (_____________)
    

end

