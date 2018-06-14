function [nome_imagem]=equalizar(imagem_hsi)
    [~, nome, extensao] = fileparts(imagem_hsi);
    imagem_hsi = imread(imagem_hsi);
    
    histograma1 = zeros(256,1);
    probabilidades = zeros(256,1);
    fda = zeros(256,1);
    nivelCinza = zeros(256,1);
    
    for i=1:size(imagem_hsi,1)  
        for j=1:size(imagem_hsi,2)
           ind = imagem_hsi(i,j) + 1;
           histograma1(ind) = histograma1(ind) +1;
        end
    end
    
    for i=1:256
        probabilidades(i) = histograma1(i)/(size(imagem_hsi,1)*size(imagem_hsi,2));
    end
    
     %FDA
     for k=1:size(probabilidades)
         soma = 0;
         for j=1:k
             soma = soma+probabilidades(j);
         end
         fda(k) = soma;
         nivelCinza(k) = round(fda(k)*255);
     end
     
    for i=1:size(imagem_hsi,1)
        for j=1:size(imagem_hsi,2)
                imagem_hsi(i,j) = nivelCinza(imagem_hsi(i,j)+1);
        end
    end
    
        nome_imagem = strcat(nome,'_equalizado', extensao);
    imwrite(imagem_hsi, nome_imagem);
     
     
end