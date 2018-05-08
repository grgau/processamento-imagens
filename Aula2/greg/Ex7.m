% Calcular taxa de amostragem e profundidade de uma imagem

arq=input('Nome do arquivo: ','s');
ext=input('Extensao do arquivo (jpg, jpeg, png): ','s');
linhas=input('Linhas: ');
colunas=input('Colunas: ');
niveis_cinza=input('Niveis de cinza: ');

profundidade = log2(niveis_cinza);
taxaAmostragem = linhas * colunas;

display(profundidade);
display(taxaAmostragem);

% Sei la nao sei cansei