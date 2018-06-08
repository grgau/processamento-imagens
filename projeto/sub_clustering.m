
function [centroides] = sub_clustering(num_centroides)
    vetor = [0, 125, 200, 120, 255, 251, 250; 255, 253, 252, 252, 254, 252, 0];
    ra = 0.5;
    rb = 1.2;
    
    tam_linhas = size(vetor, 1);
    tam_colunas = size(vetor, 2);
    
    centroides = zeros(1,num_centroides);
    
    %cria o vetor de distancias/potencias
    potencias = zeros(tam_linhas, tam_colunas);
    for i = 1: tam_linhas
       for j = 1: tam_colunas
           potencia = exp(double((-4 * abs(vetor - vetor(i,j)))/(ra*ra)));      %Trocar o vetor-vetor(i,j) por função que afeta todos os elementos do vetor dps.
           potencia = sum(potencia);
           potencia = sum(potencia);
           potencias(i,j) = potencia;
       end
    end
    disp(potencias);
    
    %Pega o maior valor M e o índice (em formato de coluna) I da matriz
    [M,I] = max(potencias(:));
    
    %Transforma I em coordenadas (x,y)
    [Ix, Iy] = ind2sub(size(potencias),I);
    fprintf("As coordenadas (x,y) encontradas do maior valor %d são (%d,%d) e seu valor na matriz é %d\n", M, Ix,Iy, vetor(Ix,Iy));
    
    %O valor correspondente à maior potencia é o primeiro centroide
    centroides(1) = vetor(Ix, Iy);
    
    for i = 2: num_centroides
        potencialCentroideAux = vetor(Ix,Iy);
        potencialCentroideAux = exp(double((-4 * abs(vetor - potencialCentroideAux))/(rb*rb)));
        potencias = potencias - (potencias .* potencialCentroideAux);
        disp(potencias);

        %Pega o maior valor M e o índice (em formato de coluna) I da matriz
        [M,I] = max(potencias(:));

        %Transforma I em coordenadas (x,y)
        [Ix, Iy] = ind2sub(size(potencias),I);
        fprintf("As coordenadas (x,y) encontradas do maior valor %d são (%d,%d) e seu valor na matriz é %d\n", M, Ix,Iy, vetor(Ix,Iy));
        
        %O valor correspondente à maior potencia é o primeiro centroide
        centroides(i) = vetor(Ix, Iy);
    end
    
    disp(centroides);
end