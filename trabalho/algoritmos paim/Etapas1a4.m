function [vetor_caracteristicas] = Etapas1a4(imagem)

%funcao conversao
nome_imagem = rgb2hsi(imagem);

%funcao equalizacao
nome_imagem = equalizar(nome_imagem);

%limiarizacao
[img_seg1,img_seg2] = limiarizacao(nome_imagem,procuraVale(nome_imagem));

%filtro morfologico (Abertura)
abertura1 = aberturaCom5Pixels(img_seg1);
abertura2 = aberturaCom5Pixels(img_seg2);
end