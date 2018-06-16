function [matrizConfusao] = montarMatrizConfusao(matriz, aux)
matrizConfusao = zeros(2,2);

for i=1:size(matriz,1)
   if matriz(i,4)==aux(i)
       if aux(i)==0
       matrizConfusao(1,1)=matrizConfusao(1,1)+1;
       else
           matrizConfusao(2,2)=matrizConfusao(2,2)+1;
       end
   else
       if matriz(i,4)==0
           matrizConfusao(2,1) = matrizConfusao(2,1)+1;
       else
           matrizConfusao(1,2) = matrizConfusao(1,2)+1;
       end
   end
end
end