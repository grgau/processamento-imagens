% Calcular histograma da imagem sem ruído e adicionar ruídos e mostrar
% histogramas

opt = input('1- Gaussiano, 2- Sal e pimenta, 3- Uniforme, 4- Poisson: ');

% Fazer histograma
I = imread('../b.jpg');
I_aux = im2double(I);
figure,bar(imhist(I_aux));
figure,bar(imhist(I_aux,50));

if opt == 1
    I_aux = I;
    p3= 0;
    p4 = 0.05;
    I_aux = im2double(I_aux);
    b = I_aux + sqrt(p4)*rand(size(I_aux)) + p3;
    imshow(b);
    figure,bar(imhist(b));
    title('Histograma ruido Gaussiano');

elseif opt == 2
    I_aux = I
    p3= 0.5;
    x = rand(size(I_aux));
    d = find(x < p3/2);
    I_aux(d) = 0; % Valor minimo
    d = find(x >= p3/2 & x < p3);
    I_aux(d) = 1; % Valor maximo
    imshow(I_aux)
    figure,bar(imhist(I_aux));
    title('Histograma ruido Sal e pimenta');
    
elseif opt == 3
    I_aux = I
    p = 0.01;
    I_aux = im2double(I_aux);
    SP=norm(I_aux).^2; % Normalizando
    NP=sqrt(SP*10^-p/length(I_aux))*3.455; % Nivel de ruido
    y=I_aux+NP*(0.5-rand(size(I_aux))); % Adição de ruido
    imshow(y)
    figure,bar(imhist(I_aux));
    title('Histograma ruido Uniforme');
    
elseif opt == 4
    
end