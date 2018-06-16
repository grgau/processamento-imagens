function OperadorMorfologico(imagem)
imagem = imread(imagem);

contador = 0;

for i=2:size(imagem,1)-1
    for j=2:size(imagem,2)-1
        if imagem(i,j)==255
             if (imagem(i-1,j-1)==255 && imagem(i-1,j)==255 && imagem(i-1,j+1) && imagem(i,j-1)==255 && imagem(i-1,j+1) && imagem(i+1,j-1)==255 && imagem(i+1,j)==255 && imagem(i+1,j+1))
                contador = contador+1;
                imagem(i,j) = 0;
             end
        end
    end
end

disp(contador);


end