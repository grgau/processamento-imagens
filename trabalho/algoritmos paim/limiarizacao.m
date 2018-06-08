function limiarizacao(imagem_equalizada, limiar1, limiar2)
    % limiar corresponde a um valor entre 0-255
    %pontos com intensidade inferior ao limiar recebem 0
    %pontos com intensidade superior ao limiar recebem 1
    [~, nome, extensao] = fileparts(imagem_equalizada);
    imagem = imread(imagem_equalizada);
    imagem_seg_1 = zeros(size(imagem));
    imagem_seg_2 = zeros(size(imagem));
    
     for i=1:size(imagem,1)
        for j=1:size(imagem,2)
                if imagem(i,j)< limiar1
                    imagem(i,j) = 1;
                elseif imagem(i,j) < limiar2
                        imagem(i,j) = 128;
                else
                    imagem(i,j) = 256;
                end
        end
     end
     
      for i=1:size(imagem,1)
        for j=1:size(imagem,2)
                if imagem(i,j)~= 1
                    imagem_seg_1(i,j) = 256;
                end
        end
     end
    nome_imagem = strcat('img_seg_1', extensao);
    imwrite(imagem_seg_1, nome_imagem);
    
     for i=1:size(imagem,1)
        for j=1:size(imagem,2)
                if imagem(i,j)~= 128
                    imagem_seg_2(i,j) = 256;
                end
        end
     end
    nome_imagem = strcat('img_seg_2', extensao);
    imwrite(imagem_seg_2, nome_imagem);

end