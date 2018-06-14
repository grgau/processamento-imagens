function [nome_imagem] = aberturaCom5Pixels(imagem)
[~, nome, extensao] = fileparts(imagem);
imagem = imread(imagem);

%erosão
for i=2:size(imagem,1)-1
    for j=2:size(imagem,2)-1
        if imagem(i,j)==255
            
             if (imagem(i+1,j)==0 || imagem(i-1,j)==0 || imagem(i,j-1)==0 || imagem(i,j+1)==0 || imagem(i+1,j)==1 || imagem(i-1,j)==1 || imagem(i,j-1)==1 || imagem(i,j+1)==1)
                imagem(i,j) = 150;
             end
        end
    end
end

for i=2:size(imagem,1)-1
    for j=2:size(imagem,2)-1
        if imagem(i,j)==150
            imagem(i,j) = 1;
        end
    end
end
%dilatação
for i=2:size(imagem,1)-1
    for j=2:size(imagem,2)-1
        if imagem(i,j)==1
             if (imagem(i+1,j)==255 || imagem(i-1,j)==255 || imagem(i,j-1)==255 || imagem(i,j+1)==255)
                imagem(i,j) = 150;
             end
        end
    end
end
for i=2:size(imagem,1)-1
    for j=2:size(imagem,2)-1
        if imagem(i,j)==150
            imagem(i,j) = 256;
        end
    end
end




%figure;imshow(imagem);

    nome_imagem = strcat(nome,' - abertura', extensao);
    imwrite(imagem, nome_imagem);


end