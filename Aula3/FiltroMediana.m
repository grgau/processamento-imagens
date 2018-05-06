function [] = FiltroMediana(imagem, filtro)
    I = imread(imagem);
    %N = imnoise(I,'salt & pepper');
    N = imnoise(I,'salt & pepper');
    %N = imnoise(I,'poisson');
    %N = imnoise(I,'speckle');
    imshow(N);
    
    b = im2double(N);
    [m,n] = size(b);
    
     c = zeros(m,n);
    

    x1 = fix (filtro/2);
    y1 = fix (filtro/2);
    
    inicioX = filtro - x1;
    inicioY = filtro - y1;
    
    disp(inicioX);
    disp(inicioY);
    
    for i = inicioX:m-inicioX
        for j = inicioY:n-inicioY

            if(filtro ==3)
                mediana = [b(i-1,j-1),b(i-1,j),b(i-1,j+1),b(i,j-1),b(i,j),b(i,j+1),b(i+1,j-1),b(i+1,j),b(i+1,j+1)];
          
            else
                mediana = [b(i-2,j-2), b(i-2,j-1), b(i-2,j), b(i-2,j+1), b(i-2,j+2),b(i-1,j-2), b(i-1,j-1), b(i-1,j), b(i-1,j+1), b(i-1,j+2),b(i,j-2), b(i,j-1), b(i,j), b(i,j+1), b(i,j+2),b(i+1,j-2), b(i+1,j-1), b(i+1,j), b(i+1,j+1), b(i+1,j+2),b(i+2,j-2), b(i+2,j-1), b(i+2,j), b(i+2,j+1), b(i+2,j+2)];
            end
 
            c(i,j) = median(mediana);
        end
    end
           


imshow(b);title('original image');
figure;
imshow(c);title('Mediana');
figure;

end