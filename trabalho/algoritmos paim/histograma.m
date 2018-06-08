function histograma(img)
    img = imread(img);
    histograma1 = zeros(256,1);
    
     for i=1:size(img,1)  
        for j=1:size(img,2)
           ind = img(i,j) + 1;
           histograma1(ind) = histograma1(ind) +1;
        end
     end
    
     figure; bar(histograma1);
end