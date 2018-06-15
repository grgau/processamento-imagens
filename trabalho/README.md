### Trabalho avaliação de PDI

###### Feito
- Pegando todas as imagens do diretorio 'imagens' e aplicando etapas em 'main.m'
- Etapa 0 (Conversao RGB para HSI-Canal I) feita
- Etapa 1 (Equalização de imagem HSI-Canal I) feita
- Todas as imagens que passam pela função de conversão da Etapa 1 são colocadas no diretorio 'imagens_hsi'
- Etapa 2 (Segmentacao em duas imagens diferentes usando algoritmo k-means com k=2) feita
- Todas as imagens que passam pela segmentação da Etapa 2 são colocadas no diretorio 'imagens_seg'
- Etapa 3 (Aplicar filtro morfologico nas duas imagens segmentadas) feita
- Escolhi o abertura usando um losango como elemento estruturante porque bola preenchida era hard, as imagens com o filtro aplicado sobrescrevem as imagens segmentadas
- Etapa 4.1 (Calcular entropia de Shannon) feita - mas tem aquela história de contar usando box counting (pois é)
- Etapa 4.2 (Quantificacao atraves de operador morfologico) acho que feita, ta contando bolas não tao bem, mas acho que a ideia é essa

###### Proximo a ser feito
- Funcao de calcular dimensao fractal
