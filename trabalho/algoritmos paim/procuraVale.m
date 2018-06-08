function [menorVale] = procuraVale(img)
    img = imread(img);
    histograma = zeros(256,1);
    menorVale = 1;
     for i=1:size(img,1)  
        for j=1:size(img,2)
           ind = img(i,j) + 1;
           histograma(ind) = histograma(ind) +1;
        end
     end
     
     for i=1:size(histograma)
        if histograma(i) < histograma(menorVale)
            menorVale = i;
        end
     end   
     disp(histograma(menorVale));
end