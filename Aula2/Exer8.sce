function []= histograma(img)   
    linhas=256;
    colunas=256;
    //img=rgb2gray(imagem);
    
    for k=1:256
        h(k)=0; 
    end
    
    for i=1:linhas
        for j=1:colunas
            ind=double(img(i,j))+1;
            h(ind) = h(ind) + 1;
        end
    end
    
    figure;
    bar(h);
endfunction

function [] = SalEPimenta(imagem)
    xset('auto clear', 'on');
    I = imread(imagem+'.jpg');
    N = imnoise(I,'salt & pepper');
    imshow(N);
    histograma(N);
    
endfunction

function [] = Gausiano(imagem)
        xset('auto clear', 'on');
    I = imread(imagem+'.jpg');
        N = imnoise(I,'gaussian',0.01);
    imshow(N);
    histograma(N);
endfunction

function [] = Poison(imagem)
            xset('auto clear', 'on');
    I = imread(imagem+'.jpg');
        N = imnoise(I,'poisson');
    imshow(N);
    histograma(N);
endfunction

function [] = Uniforme(imagem)
                xset('auto clear', 'on');
    I = imread(imagem+'.jpg');
        N = imnoise(I,'speckle');
    imshow(N);
    histograma(N);
endfunction
