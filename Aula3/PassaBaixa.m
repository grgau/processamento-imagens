function [] = PassaBaixa(imagem, filtro)
    a = imread(imagem);
    b = im2double(a);
    [m,n] = size(b);
    
    c = zeros(m,n);
    

    x1 = fix (filtro/2);
    y1 = fix (filtro/2);
    
    inicioX = filtro - x1;
    inicioY = filtro - y1;
    
    for i = inicioX:m-inicioX
        for j = inicioY:n-inicioY
            soma = 0;
            for x=-x1:x1
                for y=-y1:y1
                    soma = soma+b(i-x,j-y);
                end
            end
            c(i,j) = (1/(filtro*filtro))*soma;
            %c(i,j) = 1/9*(b(i-1,j-1) + b(i-1,j) + b(i-1,j+1) + b(i,j-1) + b(i,j) + b(i,j+1) + b(i+1,j-1) + b(i+1,j) + b(i+1,j+1));
        end
    end

    imshow(b);title('original image');
figure;
imshow(c);title('Passa Baixa');
figure;
    
end
