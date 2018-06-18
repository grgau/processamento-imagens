% Nao plotar graficos, apenas salva-los
set(0,'DefaultFigureVisible','off')

% Funcao que define o fluxograma do programa, chamando as respectivas funcoes de cada uma das etapas pre-estabelecidas

diretorio_imagens = dir('imagens/*.tif');   % Diretorio onde imagens estao armazenadas

% Inicializacao dos vetores classificadores
vetor_benigno_hsi_dim = [];
vetor_benigno_hsi_entro = [];
vetor_benigno_hsi_op = [];
        
vetor_benigno_seg_1_dim = [];
vetor_benigno_seg_1_entro = [];
vetor_benigno_seg_1_op = [];
        
vetor_benigno_seg_2_dim = [];
vetor_benigno_seg_2_entro = [];
vetor_benigno_seg_2_op = [];

vetor_maligno_hsi_dim = [];
vetor_maligno_hsi_entro = [];
vetor_maligno_hsi_op = [];
        
vetor_maligno_seg_1_dim = [];
vetor_maligno_seg_1_entro = [];
vetor_maligno_seg_1_op = [];
        
vetor_maligno_seg_2_dim = [];
vetor_maligno_seg_2_entro = [];
vetor_maligno_seg_2_op = [];


% Leitura das Imagens (executa as operacoes contidas no laco for para cada imagem dentro da pasta imagens).
for i = 1 : length(diretorio_imagens)
    nome_imagem = strcat('imagens/',diretorio_imagens(i).name);
    
    % 1 - Criacao da imagem HSI (apenas do canal I) a partir de cada imagem RGB de entrada (armazena na pasta imagens_hsi) e equalizacao da imagem
    nome_imagem_hsi = rgb2hsi(nome_imagem);
    equalizacao(nome_imagem_hsi);
    %fprintf("A imagem %s passou pela etapa de equalização!\n",nome_imagem);
    
    % 2 - Segmentacao de cada imagem obtida na etapa 1 obtendo duas regioes distintas, em imagem_seg_1 e imagem_seg_2 (armazena na pasta imagens_seg)
    [nome_imagem_seg_1, nome_imagem_seg_2] = segmentacao(nome_imagem_hsi);
    %fprintf("A imagem %s passou pela etapa de segmentação!\n",nome_imagem);
    
    % 3 - Aplicacao de um filtro morfologico (escolhido abertura com elemento estruturante circular), com o intuito de suavizar imagem
    filtro_morfologico(nome_imagem_seg_1, nome_imagem_seg_2);
    %fprintf("A imagem %s passou pela etapa de filtro morfológico!\n",nome_imagem);
   
    % 4 - Obtencao dos quantificadores: Dimensao Fractal, Entropia de Shannon e Operador morfologico das imagens: imagem_hsi, imagem_seg_1, imagem_seg_2
    %[dim_fractal_hsi, dim_fractal_seg_1, dim_fractal_seg_2]  = dimensao_fractal(nome_imagem_hsi, nome_imagem_seg_1, nome_imagem_seg_2);
    %fprintf("A imagem %s passou pela etapa de dimensão fractal!\n",nome_imagem);
    
    %[entropia_sh_hsi, entropia_sh_seg_1, entropia_sh_seg_2] = entropia_shannon(nome_imagem_hsi, nome_imagem_seg_1, nome_imagem_seg_2);
    %fprintf("A imagem %s passou pela etapa de entropia de shannon!\n",nome_imagem);
    %[op_morfologico_hsi, op_morfologico_seg_1, op_morfologico_seg_2] = operador_morfologico(nome_imagem_hsi, nome_imagem_seg_1, nome_imagem_seg_2);
    %
    % 4 - Obtencao dos quantificadores: Dimensao Fractal, Entropia de Shannon e Quantificacaoc atraves de operador morfologico das imagens: imagem_hsi, imagem_seg_1, imagem_seg_2
    [entropia_sh_hsi, entropia_sh_seg_1, entropia_sh_seg_2] = entropia_shannon(nome_imagem_hsi, nome_imagem_seg_1, nome_imagem_seg_2);
    [op_morfologico_hsi, op_morfologico_seg_1, op_morfologico_seg_2] = operador_morfologico(nome_imagem_hsi, nome_imagem_seg_1, nome_imagem_seg_2);
    [dim_fractal_hsi, dim_fractal_seg_1, dim_fractal_seg_2]  = dimensao_fractal(nome_imagem_hsi, nome_imagem_seg_1, nome_imagem_seg_2);
        
    % Construcao dos vetores de caracteristicas a serem usados na etapa 5
    if contains(nome_imagem, "benign")
        vetor_benigno_hsi_dim = [vetor_benigno_hsi_dim dim_fractal_hsi];
        vetor_benigno_hsi_entro = [vetor_benigno_hsi_entro entropia_sh_hsi];
        vetor_benigno_hsi_op = [vetor_benigno_hsi_op op_morfologico_hsi];
        
        vetor_benigno_seg_1_dim = [vetor_benigno_seg_1_dim dim_fractal_seg_1];
        vetor_benigno_seg_1_entro = [vetor_benigno_seg_1_entro entropia_sh_seg_1];
        vetor_benigno_seg_1_op = [vetor_benigno_seg_1_op op_morfologico_seg_1];
        
        vetor_benigno_seg_2_dim = [vetor_benigno_seg_2_dim dim_fractal_seg_2];
        vetor_benigno_seg_2_entro = [vetor_benigno_seg_2_entro entropia_sh_seg_2];
        vetor_benigno_seg_2_op = [vetor_benigno_seg_2_op op_morfologico_seg_2];
    else
        vetor_maligno_hsi_dim = [vetor_maligno_hsi_dim dim_fractal_hsi];
        vetor_maligno_hsi_entro = [vetor_maligno_hsi_entro entropia_sh_hsi];
        vetor_maligno_hsi_op = [vetor_maligno_hsi_op op_morfologico_hsi];
        
        vetor_maligno_seg_1_dim = [vetor_maligno_seg_1_dim dim_fractal_seg_1];
        vetor_maligno_seg_1_entro = [vetor_maligno_seg_1_entro entropia_sh_seg_2];
        vetor_maligno_seg_1_op = [vetor_maligno_seg_1_op op_morfologico_seg_2];
        
        vetor_maligno_seg_2_dim = [vetor_maligno_seg_2_dim dim_fractal_seg_2];
        vetor_maligno_seg_2_entro = [vetor_maligno_seg_2_entro entropia_sh_seg_2];
        vetor_maligno_seg_2_op = [vetor_maligno_seg_2_op op_morfologico_seg_2];
    end
end

% 5 - Construcao das curvas ROC benigno x maligno para cada caracteristica
curva_roc(vetor_benigno_hsi_dim, vetor_maligno_hsi_dim, 'Dimensao fractal em I');    
curva_roc(vetor_benigno_seg_1_dim, vetor_maligno_seg_1_dim, 'Dimensao fractal em Seg 1');    
curva_roc(vetor_benigno_seg_2_dim, vetor_maligno_seg_2_dim, 'Dimensao fractal em Seg 2');    

curva_roc(vetor_benigno_hsi_entro, vetor_maligno_hsi_entro, 'Entropia de Shannon em I');
curva_roc(vetor_benigno_seg_1_entro, vetor_maligno_seg_1_entro, 'Entropia de Shannon em Seg 1');
curva_roc(vetor_benigno_seg_2_entro, vetor_maligno_seg_2_entro, 'Entropia de Shannon em Seg 2');

curva_roc(vetor_benigno_hsi_op, vetor_maligno_hsi_op, 'Operador Morfologico em I');
curva_roc(vetor_benigno_seg_1_op, vetor_maligno_seg_1_op, 'Operador Morfologico em Seg 1');
curva_roc(vetor_benigno_seg_2_op, vetor_maligno_seg_2_op, 'Operador Morfologico em Seg 2');
