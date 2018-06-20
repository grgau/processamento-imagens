% Essa funcao recebe a imagem hsi equalizada (canal i apenas) e duas imagens segmentadas como entrada, aplica o
% o operador morfologico escolhido quantifica elementos circulares 10x6 cujas bordas possuem mesma intensidade que centro e retorna seu valor como saida.

% Elementos circulares:
%       .....
%     .       .
%   .           .
%   .     c     .
%   .           .
%     .       . 
%       .....


function [valor_op_morfologico_hsi, valor_op_morfologico_seg_1, valor_op_morfologico_seg_2] = operador_morfologico(imagem_hsi, imagem_seg_1, imagem_seg_2)
    
    % Contagem de objetos circulares detectados em cada imagem
    valor_op_morfologico_hsi = conta_objetos(imagem_hsi);
    valor_op_morfologico_seg_1 = conta_objetos(imagem_seg_1);
    valor_op_morfologico_seg_2 = conta_objetos(imagem_seg_2);

end

function contador = conta_objetos(imagem)
    imagem = imread(imagem);
    %imagem = imbinarize(imagem);
    contador = 0;
        for i=4:size(imagem,1)-3
            for j=7:size(imagem,2)-6
                s = imagem(i,j);
                if (imagem(i-3,j-2)==s && imagem(i-3,j-1)==s && imagem(i-3,j)==s && imagem(i-3,j+1)==s && imagem(i-3,j+2)==s && imagem(i-2,j-4)==s && imagem(i-2,j+4)==s && imagem(i-1,j-6)==s && imagem(i-2,j+6)==s && imagem(i,j-6)==s && imagem(i,j+6)==s && imagem(i+1,j-6)==s && imagem(i+1,j+6)==s && imagem(i+2,j-4)==s && imagem(i+2,j+4)==s && imagem(i+3,j-2)==s && imagem(i+3,j-1)==s && imagem(i+3,j)==s && imagem(i+3,j+1)==s && imagem(i+3,j+2)==s)
                    contador = contador + 1;
                end
            end
        end
end