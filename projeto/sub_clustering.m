
function centroides = sub_clustering(num_centroides, matriz)
    ra = 0.5;
    rb = 1.2;
    
    tam_linhas = size(matriz, 1);
    tam_colunas = size(matriz, 2);
    
    centroides = zeros(num_centroides,1);
    
    %cria o matriz de distancias/potencias
    potencias = zeros(tam_linhas, tam_colunas);
    for i = 1: tam_linhas
       for j = 1: tam_colunas
           potencia = exp(double((-4 * abs( double(matriz) - double(matriz(i,j))))/(ra*ra)));      %Trocar o matriz-matriz(i,j) por função que afeta todos os elementos do matriz dps.
           potencia = sum(potencia);
           potencia = sum(potencia);
           potencias(i,j) = potencia;
       end
       fprintf("Foi feita a %d linha\n",i);
    end
    %disp(potencias);
    dlmwrite('potencias1.txt',potencias);
    
    %Pega o maior valor M e o índice (em formato de coluna) I da matriz
    [M,I] = max(potencias(:));
    
    %Transforma I em coordenadas (x,y)
    [Ix, Iy] = ind2sub(size(potencias),I);
    %fprintf("As coordenadas (x,y) encontradas do maior valor %d são (%d,%d) e seu valor na matriz é %d\n", M, Ix,Iy, matriz(Ix,Iy));
    
    %O valor correspondente à maior potencia é o primeiro centroide
    centroides(1,1) = matriz(Ix, Iy);
    
    for i = 2: num_centroides
        potencialCentroideAux = matriz(Ix,Iy);
        potencialCentroideAux = exp(double((-4 * abs(double(matriz) - double(potencialCentroideAux)))/(rb*rb)));
        potencias = potencias - (potencias .* potencialCentroideAux);
        disp(potencias);

        %Pega o maior valor M e o índice (em formato de coluna) I da matriz
        [M,I] = max(potencias(:));

        %Transforma I em coordenadas (x,y)
        [Ix, Iy] = ind2sub(size(potencias),I);
        fprintf("As coordenadas (x,y) encontradas do maior valor %d são (%d,%d) e seu valor na matriz é %d\n", M, Ix,Iy, matriz(Ix,Iy));
        
        %O valor correspondente à maior potencia é o primeiro centroide
        centroides(i,1) = matriz(Ix, Iy);
        nome = strcat('potencias', int2str(i), '.txt');
        dlmwrite(nome,potencias);
    end
    %disp(centroides);
end