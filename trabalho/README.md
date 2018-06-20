### Trabalho avaliação de PDI

###### Feito
- Pegando todas as imagens do diretorio 'imagens' e aplicando etapas em 'main.m'
- Etapa 0 (Conversao RGB para HSI-Canal I) feita
- Etapa 1 (Equalização de imagem HSI-Canal I) feita
- Todas as imagens que passam pela função de conversão da Etapa 1 são colocadas no diretorio 'imagens_hsi'
- Etapa 2 (Segmentacao em duas imagens diferentes usando algoritmo k-means com k=2) feita
- Todas as imagens que passam pela segmentação da Etapa 2 são colocadas no diretorio 'imagens_seg'
- Etapa 3 (Aplicar filtro morfologico nas duas imagens segmentadas) feita
- Escolhi o abertura usando um losango 5x5 como elemento estruturante, as imagens com o filtro aplicado sobrescrevem as imagens segmentadas
- Etapa 4.1 (Calcular entropia de Shannon) feita
- Etapa 4.2 (Quantificacao atraves de operador morfologico) feita, elemento estruturante circular
- Etapa 4.3 (Dimensao fractal) feita
- Etapa 5 Curvas ROC feitas (armazenadas no diretorio 'curvas_roc') e vetores de caracteristicas armazenados no diretório 'vetores_caracteristicas'

###### Proximo a ser feito
- Finalizado