%Ex. de uso:    segmentacao_img('lena.jpg', 5)
%               segmentacao_img('rgb.jpg', 7)


function segmentacao_img(imagem, num_clusters)
    ra = 0.5;
    rb = 1.2; 
    imagem = imread(imagem);            % Le imagem
    imagem_cinza = rgb2gray(imagem);    % Converte imagem para formato lab
    numlinhas = size(imagem_cinza,1);   % Armazena numero de linhas em variavel
    numcolunas = size(imagem_cinza,2);  % Armazena numero de colunas em variavel
    
    %Agora vai come�ar umas coisa loca. Vou percorrer pixel por pixel
    %calculando a potencia dele. O de maior potencia vai ser o primeiro
    %centr�ide.
    %Come�amos transformando a matriz em um vetor pra melhorar desempenho e
    %facilidade em ler.
    imagem = reshape(imagem_cinza, 1, []);
    tam_x = size(imagem);
    disp(tam_x(2));
    
    maiorPotencial = 0;
    for i = 1:tam_x(2)
       %Aqui temos UM p�xel, bora fazer a opera��o nele.
       potencial = 0;
       valor1 = double(imagem(i));
       %agora fazer o potencial dele baseado no de todos os pixels
       for k = 1:tam_x(2)
            valor2 = double(imagem(k));
            potencial = potencial + exp( (-4* (k_func( valor1, valor1, 0.25 ) - 2*k_func(valor1, valor2, 0.25) + k_func(valor2,valor2,0.25)) )/(ra^2) );
       end
       if(potencial > maiorPotencial)
           maiorPotencial = potencial;
       end
       disp(maiorPotencial);
       disp(i);
    end
    
       
    %disp(maiorPotencial);
        
    C = [0; 20; 40; 255];
    
    % Aplica algoritmo kmeans percorrendo a imagem guardando um vetor de index e centroides
    % Parametros: imagem, quantidade de clusters da segmenta��o, 'distance' e 'sqEuclidean' definem o tipo de distancia a ser usada, 'Replicates' e valor seguinte definem quantas execu��es do kmeans ser�o realizadas

        [index, centroide] = kmeans(double(imagem_cinza(:)), num_clusters, 'distance', 'sqEuclidean', 'Display', 'final', 'Start', C); 
        disp(centroide);
   
    % Cria uma imagem segmentada, atribuindo cores para cada um dos clusters gerados pelo kmeans
    imagem_segmentada = zeros(numlinhas, numcolunas);   % Inicializa uma imagem com zeros
    for i = 1:max(index)
        imagem_segmentada(index == i) = centroide(i);   % Vetor imagem_segmentada, para index igual a i recebe valor de centroide de i 
    end
    imagesc(imagem_segmentada)          % Exibe a imagem atribuindo cores para cada um dos clusters
end