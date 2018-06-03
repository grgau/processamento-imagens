function limiarizacao(imagem_equalizada, limiar)
    % limiar corresponde a um valor entre 0-255
    %pontos com intensidade inferior ao limiar recebem 0
    %pontos com intensidade superior ao limiar recebem 1
    [~, nome, extensao] = fileparts(imagem_equalizada);
    imagem = imread(imagem_equalizada);
    
     for i=1:size(imagem,1)
        for j=1:size(imagem,2)
                if imagem(i,j) > limiar
                    imagem(i,j) = 1;
                else
                    imagem(i,j) = 256;
                end
        end
     end
    nome_imagem = strcat(nome,'_limiarizado', extensao);
    imwrite(imagem, nome_imagem);

end