function [acuracia,valor,matrizConfusao]=pontoDeCorte(matriz,indice)
valores = matriz(:,indice);
matrizConfusao = zeros(size(valores,1),2);

aux=zeros(size(valores));
disp(aux);
acuracia = 0;
valor=0;
val=0;

for i=1:size(valores)
    for j=1:size(matriz,1)
       if matriz(j,indice)< valores(i)
           aux(j)=0;
       else
           aux(j)=1;
       end
    end
    for j=1:size(matriz,1)
       if matriz(j,4)== aux(j)
           val=val+1;

       end
    end
    if val > acuracia
        acuracia = val;
        valor = valores(i);
    end
    matrizConfusaoAux = montarMatrizConfusao(matriz, aux);
    matrizConfusao(i,1) = sensibilidade(matrizConfusaoAux);
    matrizConfusao(i,2) =1 - especificidade(matrizConfusaoAux);
    val=0;
    aux=zeros(size(valores));
end

scatter(matrizConfusao(:,2),matrizConfusao(:,1));
title('Curva ROC');
xlabel('1 - especificidade');
ylabel('Sensibilidade');

end