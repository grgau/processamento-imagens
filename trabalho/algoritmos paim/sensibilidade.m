function [sensibilidade] = sensibilidade( matriz )
%{
    matriz
    A[1,1]      B[1,2]    A: verdadeiro-positivo B:Falso-positivo
    C[2,1]      D[2,2]    C:Falso-negativo       D:Verdadeiro-negativo
%}
sensibilidade = matriz(1,1)/(matriz(1,1)+ matriz(2,1));
end