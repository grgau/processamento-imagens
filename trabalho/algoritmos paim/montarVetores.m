function [matriz] = montarVetores(imgsA,classe)
tamanho = size(imgsA,2);
matriz = zeros(tamanho,4);
for i=1:size(imgsA,2)
    imagem = convertStringsToChars(imgsA(i));
    matriz(i,1) = entropia(imagem);
    matriz(i,2) =boxcounting(imagem);
    matriz(i,3) =OperadorMorfologico(imagem);
    matriz(i,4) = classe;
end

end