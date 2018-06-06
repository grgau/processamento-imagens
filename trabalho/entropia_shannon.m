% Essa funcao recebe a imagem hsi equalizada (canal i apenas) e as imagens segmentadas imagem_seg_1 e imagem_seg_2 como entrada, aplica o
% o calculo da entropia de shannon e retorna seu valor como saida.

function [valor_entropia_sh_hsi, valor_entropia_sh_seg_1, valor_entropia_sh_seg_2] = entropia_shannon(imagem_hsi, imagem_seg_1, imagem_seg_2)
    % Le imagens recebidas como entrada
    imagem_hsi = imread(imagem_hsi);
    imagem_seg_1 = imread(imagem_seg_1);
    imagem_seg_2 = imread(imagem_seg_2);

    % Contar intensidades de cinza presentes em imagem_hsi
    intensidades_hsi = zeros(1, double(max(imagem_hsi(:)))+1);  % Vetor de contar intensidades (1 a 256)
    [m_hsi,n_hsi] = size(imagem_hsi);
            
    for i = 1 : m_hsi
       for j = 1 : n_hsi
           intensidade_pixel_imagem = imagem_hsi(i,j);
           if intensidade_pixel_imagem == 0
               intensidades_hsi(256) = intensidades_hsi(256) + 1;   % Se intensidade(i,j) == 0 conta na posicao 256 do vetor de contar intensidades
           else
               intensidades_hsi(intensidade_pixel_imagem) = intensidades_hsi(intensidade_pixel_imagem) + 1;
           end
       end
    end
    
    % Contar intensidades de cinza presentes em imagem_seg_1
    intensidades_seg_1 = zeros(1, double(max(imagem_seg_1(:)))+1);  % Vetor de contar intensidades (1 a 256)
    [m_seg_1,n_seg_1] = size(imagem_seg_1);
            
    for i = 1 : m_seg_1
       for j = 1 : n_seg_1
           intensidade_pixel_imagem = imagem_seg_1(i,j);
           if intensidade_pixel_imagem == 0
               intensidades_seg_1(256) = intensidades_seg_1(256) + 1;   % Se intensidade(i,j) == 0 conta na posicao 256 do vetor de contar intensidades
           else
               intensidades_seg_1(intensidade_pixel_imagem) = intensidades_seg_1(intensidade_pixel_imagem) + 1;
           end
       end
    end
    
    % Contar intensidades de cinza presentes em imagem_seg_2
    intensidades_seg_2 = zeros(1, double(max(imagem_seg_2(:)))+1);  % Vetor de contar intensidades (1 a 256)
    [m_seg_2,n_seg_2] = size(imagem_seg_2);
            
    for i = 1 : m_seg_2
       for j = 1 : n_seg_2
           intensidade_pixel_imagem = imagem_seg_2(i,j);
           if intensidade_pixel_imagem == 0
               intensidades_seg_2(256) = intensidades_seg_2(256) + 1;   % Se intensidade(i,j) == 0 conta na posicao 256 do vetor de contar intensidades
           else
               intensidades_seg_2(intensidade_pixel_imagem) = intensidades_seg_2(intensidade_pixel_imagem) + 1;
           end
       end
    end
            
    % Entropia de shannon para imagem_hsi
    Pi = intensidades_hsi/(m_hsi*n_hsi);
    valor_entropia_sh_hsi = sum(-(Pi(Pi>0).*(log2(Pi(Pi>0)))));
    
    % Entropia de shannon para imagem_seg_1
    Pi = intensidades_seg_1/(m_seg_1*n_seg_1);
    valor_entropia_sh_seg_1 = sum(-(Pi(Pi>0).*(log2(Pi(Pi>0)))));
    
    % Entropia de shannon para imagem_seg_2
    Pi = intensidades_seg_2/(m_seg_2*n_seg_2);
    valor_entropia_sh_seg_2 = sum(-(Pi(Pi>0).*(log2(Pi(Pi>0)))));
    
end

