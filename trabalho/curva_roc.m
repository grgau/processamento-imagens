% Funcao responsavel por realizar o grafico ROC juntamente com com a tabela
% de contingencia e a matriz de confusão

function curva_roc(vetor_benigno, vetor_maligno, titulo)
    % Definicao de vetores para cada ponto de corte
    sensibilidade = [];
    especificidade = [];
    acuracia = [];
    precisao = [];
    vetor_pontos_corte = [];

    % Ordenacao de vetores para facilitar calculos
    vetor_benigno = sort(vetor_benigno);
    vetor_maligno = sort(vetor_maligno);
    
    % Valor inicial de ponto corte
    if min(vetor_benigno) < min(vetor_maligno)
        ponto_corte = (min(vetor_benigno))/2;
    else
        ponto_corte = (min(vetor_maligno))/2;
    end
    
    while(ponto_corte < max(vetor_benigno) || ponto_corte < max(vetor_maligno))
        
        % Tabela de contingencia
        VP = sum(vetor_maligno >= ponto_corte);
        VN = sum(vetor_benigno < ponto_corte);
        FP = sum(vetor_benigno >= ponto_corte);
        FN = sum(vetor_maligno < ponto_corte);
        P = VP + FP;
        N = VN + FN;

        tab_contingencia = [VP FP; FN VN];

        % Calcula os valores acrescentando ao vetor de cada um deles
        sensibilidade = [sensibilidade (VP / (VP + FN)) * 100];
        especificidade = [especificidade (VN / (FP + VN)) * 100];
        acuracia = [acuracia ((VP + VN) / (P + N)) * 100];
        precisao = [precisao (VP / (VP + FP)) * 100];
        
        % Incremento de ponto corte
        ponto_corte = ponto_corte + (min(abs(vetor_benigno - vetor_maligno)))/2;
        vetor_pontos_corte = [vetor_pontos_corte ponto_corte];
    end
    
    % Construcao de matriz de resultados contendo valores relacionados de especificidade,
    % sensibilidade e ponto de corte unicos. Sera usado na construcao do
    % grafico ROC
    espec = (100-especificidade)';
    senc = sensibilidade';
    p_cortes = vetor_pontos_corte';
    matriz_resultados = [espec(:), senc(:), p_cortes(:)];
    [matriz_resultados_unique, ia, ~] = unique(matriz_resultados(:,[1 2]), 'rows');
        
    auxiliar_pontos_corte = [];
    for i=1:size(ia,1)
        linha = ia(i,1);
        auxiliar_pontos_corte = [auxiliar_pontos_corte p_cortes(linha,1)];    
    end
        
    auxiliar_pontos_corte = auxiliar_pontos_corte';
    matriz_resultados_unique = [matriz_resultados_unique, auxiliar_pontos_corte(:)];         
    
    % Construcao do grafico ROC
    plot(matriz_resultados_unique(:,1), matriz_resultados_unique(:,2), '.-', 'MarkerSize', 12);
    
    % Escrevendo os resultados de ponto de corte referente ao valor de
    % sensibilidade e especificidade no grafico ROC
    for linha = 1:size(matriz_resultados_unique(:,1))
        text(matriz_resultados_unique(linha,1),matriz_resultados_unique(linha,2), string(matriz_resultados_unique(linha,3)))
    end
    
    title(titulo);
    xlabel('1-Especificidade (%)') % x-axis label
    ylabel('Sensibilidade (%)') % y-axis label
    
    % Salvando grafico ROC
    saveas(gcf, strcat('curvas_roc/', titulo,'.jpg'))
           
    % A partir da matriz de resultados previamente construida, constroi a
    % matriz de confusao, escolhendo o maior valor de acuracia da matriz de
    % resultados
    espec = especificidade';
    sens = sensibilidade';
    p_cortes = vetor_pontos_corte';
    acur = acuracia';

    matriz_confusao = [sens(:), p_cortes(:), espec(:), acur(:)];
    [~,x] = max(matriz_confusao(:,4));
    matriz_confusao = matriz_confusao(x,:);
    matriz_confusao = reshape(matriz_confusao,[2,2]);

    disp(titulo);
    disp(matriz_confusao);
end