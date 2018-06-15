% Essa funcao recebe a imagem hsi equalizada (canal i apenas) e duas imagens segmentadas como entrada, aplica o
% o operador morfologico escolhido (______________) e retorna seu valor como saida.

function [valor_op_morfologico_hsi, valor_op_morfologico_seg_1, valor_op_morfologico_seg_2] = operador_morfologico(imagem_hsi, imagem_seg_1, imagem_seg_2)
    % Le imagens recebidas como entrada
    imagem_hsi = imread(imagem_hsi);
    imagem_seg_1 = imread(imagem_seg_1);
    imagem_seg_2 = imread(imagem_seg_2);
    
    % Binarizar as imagens para aplicar operador morfolofico
    imagem_hsi = imbinarize(imagem_hsi);
    imagem_seg_1 = imbinarize(imagem_seg_1);
    imagem_seg_2 = imbinarize(imagem_seg_2);
    
    % Operacao de abertura com 5 pixels em formato de cruz
    
    
    
    % Contagem de objetos circulares detectados em cada imagem
    valor_op_morfologico_hsi = 0;
    valor_op_morfologico_seg_1 = 0;
    valor_op_morfologico_seg_2 = 0;
    
    
    % La�o que percorre a imagem
    for i=9:size(imagem_hsi,1)-8
        for j=9:size(imagem_hsi,2)-8
            if(imagem_hsi(i+8,j)==0 && imagem_hsi(i+7,j-1)==0 && imagem_hsi(i+7,j+1)==0 && imagem_hsi(i+6,j-2)==0 && imagem_hsi(i+6,j+2)==0 && imagem_hsi(i+5,j-3)==0 && imagem_hsi(i+5,j+3)==0 && imagem_hsi(i+4,j-4)==0 && imagem_hsi(i+4,j+4)==0 && imagem_hsi(i+3,j-5)==0 && imagem_hsi(i+3,j+5)==0 && imagem_hsi(i+2,j-6)==0 && imagem_hsi(i+2,j+6)==0 && imagem_hsi(i+1,j-7)==0 && imagem_hsi(i+1,j+7)==0 && imagem_hsi(i,j-8)==0 && imagem_hsi(i,j+8)==0 && imagem_hsi(i-1,j-7)==0 && imagem_hsi(i-1,j+7)==0 && imagem_hsi(i-2,j-6)==0 && imagem_hsi(i-2,j+6)==0 && imagem_hsi(i-3,j-5)==0 && imagem_hsi(i-3,j+5)==0 && imagem_hsi(i-4,j-4)==0 && imagem_hsi(i-4,j+4)==0 && imagem_hsi(i-5,j-3)==0 && imagem_hsi(i-5,j+3)==0 && imagem_hsi(i-6,j-2)==0 && imagem_hsi(i-6,j+2)==0 && imagem_hsi(i-7,j-1)==0 && imagem_hsi(i-7,j+1)==0 && imagem_hsi(i-8,j)==0)
                    valor_op_morfologico_hsi = valor_op_morfologico_hsi+1;
                    if i+8 < size(imagem_hsi,1)-8
                        i = i+8;
                    end
                    if j+8 < size(imagem_hsi,2)-8
                        j = j+8;
                    end
            end        
        end
    end
    
    % La�o que percorre a imagem
    for i=9:size(imagem_seg_1,1)-8
        for j=9:size(imagem_seg_1,2)-8
            if(imagem_seg_1(i+8,j)==0 && imagem_seg_1(i+7,j-1)==0 && imagem_seg_1(i+7,j+1)==0 && imagem_seg_1(i+6,j-2)==0 && imagem_seg_1(i+6,j+2)==0 && imagem_seg_1(i+5,j-3)==0 && imagem_seg_1(i+5,j+3)==0 && imagem_seg_1(i+4,j-4)==0 && imagem_seg_1(i+4,j+4)==0 && imagem_seg_1(i+3,j-5)==0 && imagem_seg_1(i+3,j+5)==0 && imagem_seg_1(i+2,j-6)==0 && imagem_seg_1(i+2,j+6)==0 && imagem_seg_1(i+1,j-7)==0 && imagem_seg_1(i+1,j+7)==0 && imagem_seg_1(i,j-8)==0 && imagem_seg_1(i,j+8)==0 && imagem_seg_1(i-1,j-7)==0 && imagem_seg_1(i-1,j+7)==0 && imagem_seg_1(i-2,j-6)==0 && imagem_seg_1(i-2,j+6)==0 && imagem_seg_1(i-3,j-5)==0 && imagem_seg_1(i-3,j+5)==0 && imagem_seg_1(i-4,j-4)==0 && imagem_seg_1(i-4,j+4)==0 && imagem_seg_1(i-5,j-3)==0 && imagem_seg_1(i-5,j+3)==0 && imagem_seg_1(i-6,j-2)==0 && imagem_seg_1(i-6,j+2)==0 && imagem_seg_1(i-7,j-1)==0 && imagem_seg_1(i-7,j+1)==0 && imagem_seg_1(i-8,j)==0)
                    valor_op_morfologico_seg_1 = valor_op_morfologico_seg_1+1;
                    if i+8 < size(imagem_seg_1,1)-8
                        i = i+8;
                    end
                    if j+8 < size(imagem_seg_1,2)-8
                        j = j+8;
                    end
            end        
        end
    end
    
    % La�o que percorre a imagem
    for i=9:size(imagem_seg_2,1)-8
        for j=9:size(imagem_seg_2,2)-8
            if(imagem_seg_2(i+8,j)==0 && imagem_seg_2(i+7,j-1)==0 && imagem_seg_2(i+7,j+1)==0 && imagem_seg_2(i+6,j-2)==0 && imagem_seg_2(i+6,j+2)==0 && imagem_seg_2(i+5,j-3)==0 && imagem_seg_2(i+5,j+3)==0 && imagem_seg_2(i+4,j-4)==0 && imagem_seg_2(i+4,j+4)==0 && imagem_seg_2(i+3,j-5)==0 && imagem_seg_2(i+3,j+5)==0 && imagem_seg_2(i+2,j-6)==0 && imagem_seg_2(i+2,j+6)==0 && imagem_seg_2(i+1,j-7)==0 && imagem_seg_2(i+1,j+7)==0 && imagem_seg_2(i,j-8)==0 && imagem_seg_2(i,j+8)==0 && imagem_seg_2(i-1,j-7)==0 && imagem_seg_2(i-1,j+7)==0 && imagem_seg_2(i-2,j-6)==0 && imagem_seg_2(i-2,j+6)==0 && imagem_seg_2(i-3,j-5)==0 && imagem_seg_2(i-3,j+5)==0 && imagem_seg_2(i-4,j-4)==0 && imagem_seg_2(i-4,j+4)==0 && imagem_seg_2(i-5,j-3)==0 && imagem_seg_2(i-5,j+3)==0 && imagem_seg_2(i-6,j-2)==0 && imagem_seg_2(i-6,j+2)==0 && imagem_seg_2(i-7,j-1)==0 && imagem_seg_2(i-7,j+1)==0 && imagem_seg_2(i-8,j)==0)
                    valor_op_morfologico_seg_2 = valor_op_morfologico_seg_2+1;
                    if i+8 < size(imagem_seg_2,1)-8
                        i = i+8;
                    end
                    if j+8 < size(imagem_seg_2,2)-8
                        j = j+8;
                    end
            end        
        end
    end
end

