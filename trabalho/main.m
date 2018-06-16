% Funcao que define o fluxograma do programa, chamando as respectivas funcoes de cada uma das etapas pre-estabelecidas

diretorio_imagens = dir('imagens/*.tif');   % Diretorio onde imagens estao armazenadas

% Leitura das Imagens (executa as operacoes contidas no laco for para cada imagem dentro da pasta imagens).
for i = 1 : length(diretorio_imagens)
    nome_imagem = strcat('imagens/',diretorio_imagens(i).name);
    
    % 1 - Criacao da imagem HSI (apenas do canal I) a partir de cada imagem RGB de entrada (armazena na pasta imagens_hsi) e equalizacao da imagem
    nome_imagem_hsi = rgb2hsi(nome_imagem);
    equalizacao(nome_imagem_hsi);
    fprintf("A imagem %s passou pela etapa de equalização!\n",nome_imagem);
    
    % 2 - Segmentacao de cada imagem obtida na etapa 1 obtendo duas regioes distintas, em imagem_seg_1 e imagem_seg_2 (armazena na pasta imagens_seg)
    [nome_imagem_seg_1, nome_imagem_seg_2] = segmentacao(nome_imagem_hsi);
    fprintf("A imagem %s passou pela etapa de segmentação!\n",nome_imagem);
    
    % 3 - Aplicacao de um filtro morfologico (escolhido abertura com elemento estruturante circular), com o intuito de suavizar imagem
    filtro_morfologico(nome_imagem_seg_1, nome_imagem_seg_2);
    fprintf("A imagem %s passou pela etapa de filtro morfológico!\n",nome_imagem);
   
<<<<<<< HEAD
    % 4 - Obtencao dos quantificadores: Dimensao Fractal, Entropia de Shannon e Operador morfologico das imagens: imagem_hsi, imagem_seg_1, imagem_seg_2
    [dim_fractal_hsi, dim_fractal_seg_1, dim_fractal_seg_2]  = dimensao_fractal(nome_imagem_hsi, nome_imagem_seg_1, nome_imagem_seg_2);
    fprintf("A imagem %s passou pela etapa de dimensão fractal!\n",nome_imagem);
    
    [entropia_sh_hsi, entropia_sh_seg_1, entropia_sh_seg_2] = entropia_shannon(nome_imagem_hsi, nome_imagem_seg_1, nome_imagem_seg_2);
    fprintf("A imagem %s passou pela etapa de entropia de shannon!\n",nome_imagem);
    %[op_morfologico_hsi, op_morfologico_seg_1, op_morfologico_seg_2] = operador_morfologico(nome_imagem_hsi, nome_imagem_seg_1, nome_imagem_seg_2);
    %
=======
    % 4 - Obtencao dos quantificadores: Dimensao Fractal, Entropia de Shannon e Quantificacaoc atraves de operador morfologico das imagens: imagem_hsi, imagem_seg_1, imagem_seg_2
    %[dim_fractal_hsi, dim_fractal_seg_1, dim_fractal_seg_2]  = dimensao_fractal(nome_imagem_hsi, nome_imagem_seg_1, nome_imagem_seg_2);
    [entropia_sh_hsi, entropia_sh_seg_1, entropia_sh_seg_2] = entropia_shannon(nome_imagem_hsi, nome_imagem_seg_1, nome_imagem_seg_2);
    [op_morfologico_hsi, op_morfologico_seg_1, op_morfologico_seg_2] = operador_morfologico(nome_imagem_hsi, nome_imagem_seg_1, nome_imagem_seg_2);
    
>>>>>>> d7f45166f69b3981410ad9840f690133a5fe0dcb
    %vetor_caracteristicas_hsi = [dim_fractal_hsi, entropia_sh_hsi, op_morfologico_hsi];
    %vetor_caracteristicas_seg_1 = [dim_fractal_seg_1, entropia_sh_seg_1, op_morfologico_seg_1];
    %vetor_caracteristicas_seg_2 = [dim_fractal_seg_2, entropia_sh_seg_2, op_morfologico_seg_2];
end