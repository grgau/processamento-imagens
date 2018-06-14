function [nome_imagem1,nome_imagem2] =limiarizacao(imagem_equalizada, limiar)
    % limiar corresponde a um valor entre 0-255
    %pontos com intensidade inferior ao limiar recebem 0
    %pontos com intensidade superior ao limiar recebem 1
    [~, nome, extensao] = fileparts(imagem_equalizada);
    imagem = imread(imagem_equalizada);

    
     for i=1:size(imagem,1)
        for j=1:size(imagem,2)
                if imagem(i,j)< limiar
                    imagem(i,j) = 256;
                else
                    imagem(i,j) = 1;
                end
        end
     end

    %objeto marcado em branco
    nome_imagem1 = strcat('img_seg_1', extensao);
    imwrite(imagem, nome_imagem1);
    
     for i=1:size(imagem,1)
        for j=1:size(imagem,2)
                if imagem(i,j)==255
                    imagem(i,j) = 0;
                else
                    imagem(i,j) = 256;
                end
        end
     end
     
     %fundo marcado em branco
    nome_imagem2 = strcat('img_seg_2', extensao);
    imwrite(imagem, nome_imagem2);

end