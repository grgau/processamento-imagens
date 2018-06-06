% Essa funcao faz a equalizacao de uma imagem em niveis de cinza dada como entrada.

function [] = equalizacao(imagem_hsi)
    % Nome da imagem que sera usado para gerar imagem HSI
    [~, nome, extensao] = fileparts(imagem_hsi);
    
    % Le imagem recebida como entrada
    imagem_hsi = imread(imagem_hsi);
    
    % Vetores auxiliares para equalizacao
    frequencia_valor = zeros(256,1);    % Conta a quantidade de vezes que uma intensidade é encontrada
    prob = zeros(256,1);                % Conta a probabilidade de cada intensidade
    fda = zeros(256,1);                 % Probabilidade acumulativa de cada intensidade
    cumulativo = zeros(256,1);          % Vetor auxiliar para calcular fda
    output = zeros(256,1);              % Vetor auxiliar para equalizar imagem_hsi

    % Conta a ocorrencia de cada intensidade de pixel e calcula a sua respectiva probabilidade
    for i=1:size(imagem_hsi,1)
        for j=1:size(imagem_hsi,2)
            valor = imagem_hsi(i,j);
            frequencia_valor(valor+1) = frequencia_valor(valor+1)+1;
            prob(valor+1) = frequencia_valor(valor+1)/(size(imagem_hsi,1)*size(imagem_hsi,2));
        end
    end

    somatorio = 0;
    % Calculando a distribuicao acumulada fda  
    for i=1:size(prob)
       somatorio = somatorio + frequencia_valor(i);
       cumulativo(i) = somatorio;
       fda(i) = cumulativo(i)/(size(imagem_hsi,1)*size(imagem_hsi,2));
       output(i)= round(fda(i)*255);
    end

    % Sobrescreve a imagem_hsi, equalizando-a
    for i=1:size(imagem_hsi,1)
        for j=1:size(imagem_hsi,2)
            imagem_hsi(i,j) = output(imagem_hsi(i,j)+1);
        end
    end
    
    % Sobrescreve em disco a imagem_hsi equalizada
    nome_imagem_hsi = strcat('imagens_hsi/', nome, extensao);
    imwrite(imagem_hsi, nome_imagem_hsi);
end

