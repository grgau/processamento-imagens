%Exemplo Código Base Matlab
clear;
% Leitura da Imagem
arq=input('Nome do arquivo: ','s');
ext=input('Extensao do arquivo (jpg, jpeg, png): ','s');

%Leitura da Imagem
imagem=imread(arq,ext);

%define o tamanho da imagem
linhas=input('Linhas: ');
colunas=input('Colunas: ');
img=rgb2gray(imagem);

R = imagem(:, :, 1); % Matriz de tons vermelhos
G = imagem(:, :, 2); % Matriz de tons verdes
B = imagem(:, :, 3); % Matriz de tons azuis

figure; imshow(R);figure; imshow(G);figure; imshow(B);


%Zera o vetor do histograma
for k=1:256
   h(k)=0; 
end

%Cria o histograma
for i=1:linhas
    for j=1:colunas
        ind=double(img(i,j))+1;
        h(ind) = h(ind) + 1;
    end
end

%apresenta a imagem colorida
figure;
imshow(imagem);

%apresenta a imagem tons de cinza
figure;
imshow(img);

%histograma da imagem
figure;
bar(h);

%salva o histograma
imwrite(img,'histograma.jpg'); 