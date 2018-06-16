%Esse arquivo é usado para contar o número de cubos que interceptam a
%imagem desejada

function dimensao_fractal = conta_caixas(matriz)
    tamanho = size(matriz);

    tam_x = tamanho(1);
    tam_y = tamanho(2);
    
    %O tamanho inicial da caixa é o maior tamanho possível que caiba tanto
    %na altura quanto na largura
    
    tam_caixa = min(tam_x, tam_y);
    num_iteracoes = floor(log2(tam_caixa))-1;
    dimensao_fractal = 0;
    
    for d = 1: num_iteracoes
        total_cubos = 0;
        tam_caixa = floor(tam_caixa/2);
        for i=1:tam_caixa:tam_x
            for j=1:tam_caixa:tam_y
                %fprintf("%d < %d\n", j+tam_caixa, tam_y);
                if ((j+tam_caixa-1) <= tam_y ) && ((i+tam_caixa-1) <= tam_x)
                    %fprintf("(%d,%d) até (%d,%d)\n", i, j, i+tam_caixa-1, j+tam_caixa-1);
                    area = zeros(tam_caixa,tam_caixa);
                    area = matriz( [i:i+tam_caixa-1], [j:j+tam_caixa-1]);
                    minimo_area = min(area);
                    minimo_area = min(minimo_area);
                    maximo_area = max(area);
                    maximo_area = max(maximo_area);
                    num_cubos = uint8(floor(((maximo_area - minimo_area)/tam_caixa))) + 1;
                    %fprintf("%d - %d + 1 = %d\n", maximo_area, minimo_area, num_cubos);
                    %display(num_cubos);
                    total_cubos = uint64(total_cubos + uint64(num_cubos));
                end
            end
        end
        %display(total_cubos);
        dimensao_fractal = dimensao_fractal + log2(double(total_cubos))/log2(2^d);
        %display(dimensao_fractal);
        %fprintf("Com %d cortes, o total de cubos foi %d e a dimensão fractal foi %d! -> %d/%d\n", d, total_cubos, dimensao_fractal, log2(double(total_cubos)), log2(2^d))
    end
    dimensao_fractal = dimensao_fractal/num_iteracoes;
    
    %fprintf("A dimensão fractal foi %d\n\n", dimensao_fractal);
    
end