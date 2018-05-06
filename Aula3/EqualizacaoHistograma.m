function EqualizacaoHistograma(imagem)
    I = imread(imagem);
    [m,n] = size(I);
    c = zeros(m,n);
    
    for k=1:256
        h1(k)=0; 
        h2(k)=0;
        equalizado(k) = 0;
        fda(k) = 0;
        nivelCinza(k) = 0;
    end

    
    for i=1:m
        for j=1:n
            ind=double(I(i,j))+1;
            h1(ind) = h1(ind) + 1;
        end
    end

    
    
     for k=1:256
         equalizado(k)=h1(k)/(m*n); 
     end

 
     %FDA
     for k=1:256
         soma = 0;
         for j=1:k
             soma = soma+equalizado(j);
         end
         fda(k) = soma;
     end

%     
     for k=1:256
        nivelCinza(k) = round (fda(k)*255);
     end

%     
     for i=1:m
        for j=1:n
             c(i,j) = nivelCinza(double(I(i,j))+1);
         end
     end
     
    disp(size(c));
    for i=1:m
        for j=1:n
            ind=c(i,j)+1;
            h2(ind) = h2(ind) + 1;
        end
    end
    
    figure;
    bar(h2);title('2');
    
    figure;
    bar(h1);title('1');



end