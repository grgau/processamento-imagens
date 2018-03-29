matriz = [121, 20, 198, 84, 4; 87, 188, 189, 99, 8; 88, 115, 134, 49, 19; 16, 18, 187, 98, 9; 12, 103, 15, 176, 38];
tam_matriz = 5;
tam_janela = 3;
matriz_resultado = matriz;


for i=1+(floor(tam_janela/2)):tam_matriz-(floor(tam_janela/2))
    for j=1+(floor(tam_janela/2)):tam_matriz-(floor(tam_janela/2))
        matriz_resultado(i,j) = 0;
        for k=i-(floor(tam_janela/2)):i+(floor(tam_janela/2))
            for w=j-(floor(tam_janela/2)):j+(floor(tam_janela/2))
                matriz_resultado(i,j) = floor((matriz_resultado(i,j) + matriz(k,w))/9); %Fazendo a media
            end
        end
    end
end

