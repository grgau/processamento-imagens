function [valor_final] = entropia(imagem)

img = imread(imagem);
[linhas,colunas] = size(img);

histograma = zeros(1, double(max(img(:)))+1);  % Vetor de contar intensidades (1 a 256)
     for i=1:size(img,1)  
        for j=1:size(img,2)
           ind = img(i,j) + 1;
           histograma(ind) = histograma(ind) +1;
        end
     end
     
     
     Pi = histograma/(linhas*colunas);
    valor_final = sum(-(Pi(Pi>0).*(log2(Pi(Pi>0)))));
    disp(valor_final); 
end