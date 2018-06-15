function aberturaCruz()
imagem = imread('C:\Users\pedro\Desktop\PDI\trabalho\imagens_hsi\ytma10_010704_benign2_ccd_hsi_i.tif');
imagem = imbinarize(imagem);

contador = 0;
% Laço que percorre a imagem
for i=9:size(imagem,1)-8
    for j=9:size(imagem,2)-8
        if(imagem(i+8,j)==0 && imagem(i+7,j-1)==0 && imagem(i+7,j+1)==0 && imagem(i+6,j-2)==0 && imagem(i+6,j+2)==0 && imagem(i+5,j-3)==0 && imagem(i+5,j+3)==0 && imagem(i+4,j-4)==0 && imagem(i+4,j+4)==0 && imagem(i+3,j-5)==0 && imagem(i+3,j+5)==0 && imagem(i+2,j-6)==0 && imagem(i+2,j+6)==0 && imagem(i+1,j-7)==0 && imagem(i+1,j+7)==0 && imagem(i,j-8)==0 && imagem(i,j+8)==0 && imagem(i-1,j-7)==0 && imagem(i-1,j+7)==0 && imagem(i-2,j-6)==0 && imagem(i-2,j+6)==0 && imagem(i-3,j-5)==0 && imagem(i-3,j+5)==0 && imagem(i-4,j-4)==0 && imagem(i-4,j+4)==0 && imagem(i-5,j-3)==0 && imagem(i-5,j+3)==0 && imagem(i-6,j-2)==0 && imagem(i-6,j+2)==0 && imagem(i-7,j-1)==0 && imagem(i-7,j+1)==0 && imagem(i-8,j)==0)
                contador = contador+1;
                if i+8 < size(imagem,1)-8
                    i = i+8;
                end
                if j+8 < size(imagem,2)-8
                    j = j+8;
                end
        end        
    end
end
disp(contador);
end