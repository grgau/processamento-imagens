function [vetor] = vetorCaracteristicas(imagem)
%{
vetor(0) = entropia
vetor(1) = dimensao fractal
vetor(2) = operadorMorfologico
%}

vetor = zeros(4,1);


vetor(1) = entropia(imagem);
vetor(2) = boxcounting(imagem);
vetor(3) = OperadorMorfologico(imagem);


disp(vetor(1));
disp(vetor(2));
disp(vetor(3));
end