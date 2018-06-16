% Essa funcao recebe duas imagens segmentadas como entrada, aplica um
% filtro morfologico (abertura em com elemento estruturante losangular) nelas e as retorna como saida.

% Elemento estruturante losagonal:
%     .
%    ...
%   ..c..
%    ...
%     .


function [] = filtro_morfologico(imagem_seg_1, imagem_seg_2)
    % Nome das imagens que terão o filtro morfologico aplicado
    [~, nome1, ~] = fileparts(imagem_seg_1);
    [~, nome2, extensao] = fileparts(imagem_seg_2);

    % Le imagens recebidas como entrada
    imagem_seg_1 = imread(imagem_seg_1);
    imagem_seg_2 = imread(imagem_seg_2);
        
    % Erosão da imagem_seg_1
    for i=4:size(imagem_seg_1,1)-3
        for j=7:size(imagem_seg_1,2)-6
            if imagem_seg_1(i,j)==255
                 if(imagem_seg_1(i-2,j)==0 || imagem_seg_1(i-1,j-1)==0 || imagem_seg_1(i-1,j)==0 || imagem_seg_1(i-1,j+1)==0 || imagem_seg_1(i,j-2)==0 || imagem_seg_1(i,j-1)==0 || imagem_seg_1(i,j)==0 || imagem_seg_1(i,j+1)==0 || imagem_seg_1(i,j+2)==0 || imagem_seg_1(i+1,j-1)==0 || imagem_seg_1(i+1,j)==0 || imagem_seg_1(i+1,j+1)==0 || imagem_seg_1(i+2,j)==0)
                    imagem_seg_1(i,j) = 150;
                 end
            end
        end
    end
    for i=4:size(imagem_seg_1,1)-3
        for j=7:size(imagem_seg_1,2)-6
            if imagem_seg_1(i,j)==150
                imagem_seg_1(i,j) = 1;
            end
        end
    end
    
    % Dilatação da imagem_seg_1
    for i=4:size(imagem_seg_1,1)-3
        for j=7:size(imagem_seg_1,2)-6
            if imagem_seg_1(i,j)==1
                 if(imagem_seg_1(i-2,j)==255 || imagem_seg_1(i-1,j-1)==255 || imagem_seg_1(i-1,j)==255 || imagem_seg_1(i-1,j+1)==255 || imagem_seg_1(i,j-2)==255 || imagem_seg_1(i,j-1)==255 || imagem_seg_1(i,j)==255 || imagem_seg_1(i,j+1)==255 || imagem_seg_1(i,j+2)==255 || imagem_seg_1(i+1,j-1)==255 || imagem_seg_1(i+1,j)==255 || imagem_seg_1(i+1,j+1)==255 || imagem_seg_1(i+2,j)==255)
                    imagem_seg_1(i,j) = 150;
                 end
            end
        end
    end
    for i=4:size(imagem_seg_1,1)-3
        for j=7:size(imagem_seg_1,2)-6
            if imagem_seg_1(i,j)==150
                imagem_seg_1(i,j) = 256;
            end
        end
    end

    % Erosão da imagem_seg_2
    for i=4:size(imagem_seg_2,1)-3
        for j=7:size(imagem_seg_2,2)-6
            if imagem_seg_2(i,j)==255
                 if(imagem_seg_2(i-2,j)==0 || imagem_seg_2(i-1,j-1)==0 || imagem_seg_2(i-1,j)==0 || imagem_seg_2(i-1,j+1)==0 || imagem_seg_2(i,j-2)==0 || imagem_seg_2(i,j-1)==0 || imagem_seg_2(i,j)==0 || imagem_seg_2(i,j+1)==0 || imagem_seg_2(i,j+2)==0 || imagem_seg_2(i+1,j-1)==0 || imagem_seg_2(i+1,j)==0 || imagem_seg_2(i+1,j+1)==0 || imagem_seg_2(i+2,j)==0)
                    imagem_seg_2(i,j) = 150;
                 end
            end
        end
    end
    for i=4:size(imagem_seg_2,1)-3
        for j=7:size(imagem_seg_2,2)-6
            if imagem_seg_2(i,j)==150
                imagem_seg_2(i,j) = 1;
            end
        end
    end
    
    % Dilatação da imagem_seg_2
    for i=4:size(imagem_seg_2,1)-3
        for j=7:size(imagem_seg_2,2)-6
            if imagem_seg_2(i,j)==1
                 if(imagem_seg_2(i-2,j)==255 || imagem_seg_2(i-1,j-1)==255 || imagem_seg_2(i-1,j)==255 || imagem_seg_2(i-1,j+1)==255 || imagem_seg_2(i,j-2)==255 || imagem_seg_2(i,j-1)==255 || imagem_seg_2(i,j)==255 || imagem_seg_2(i,j+1)==255 || imagem_seg_2(i,j+2)==255 || imagem_seg_2(i+1,j-1)==255 || imagem_seg_2(i+1,j)==255 || imagem_seg_2(i+1,j+1)==255 || imagem_seg_2(i+2,j)==255)
                    imagem_seg_2(i,j) = 150;
                 end
            end
        end
    end
    for i=4:size(imagem_seg_2,1)-3
        for j=7:size(imagem_seg_2,2)-6
            if imagem_seg_2(i,j)==150
                imagem_seg_2(i,j) = 256;
            end
        end
    end
    
    % Sobrescreve em disco as imagens segmentadas apos aplicacao do filtro
    nome_imagem_filtro_1 = strcat('imagens_seg/', nome1, extensao);
    nome_imagem_filtro_2 = strcat('imagens_seg/', nome2, extensao);
    imwrite(imagem_seg_1, nome_imagem_filtro_1);
    imwrite(imagem_seg_2, nome_imagem_filtro_2);
end

