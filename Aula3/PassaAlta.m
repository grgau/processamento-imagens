function [] = PassaAlta(imagem)
    a = imread(imagem);
    b = im2double(a);
    [m,n] = size(b);
    
    c = zeros(m,n);
    
    h1 =[ -1,-1,-1;
          -1,8,-1;
          -1,-1,-1];

    
    for i = 2:m-1
        for j = 2:n-1
            c(i,j) = (b(i-1,j-1)*h1(1,1) + b(i-1,j)*h1(1,2) + b(i-1,j+1)*h1(1,3) + b(i,j-1)*h1(2,1) + b(i,j)*h1(2,2) + b(i,j+1)*h1(2,3) + b(i+1,j-1)*h1(3,1) + b(i+1,j)*h1(3,2) + b(i+1,j+1)*h1(3,3));
        end
    end

    imshow(b);title('original image');
figure;
imshow(c);title('Passa Alta');
figure;
end