### Trabalho avaliação de PDI

###### Feito
- Pegando todas as imagens do diretorio 'imagens' e aplicando etapas em 'main.m'
- Etapa 0 (Conversao RGB para HSI-Canal I) feita
- Etapa 1 (Equalização de imagem HSI-Canal I) feita
- Todas as imagens que passam pela função de conversão da Etapa 1 são colocadas no diretorio 'imagens_hsi'
- Etapa 2 (Segmentacao em duas imagens diferentes usando algoritmo k-means com k=2) feita
- Todas as imagens que passam pela segmentação da Etapa 2 são colocadas no diretorio 'imagens_seg'
- Etapa 3 (Aplicar filtro morfologico nas duas imagens segmentadas) feita
- Escolhi o filtro gaussiano, as imagens com o filtro aplicado sobrescrevem as imagens segmentadas

###### Proximo a ser feito
- Funcao de calcular dimensao fractal
- Funcao de calcular entropia de shannon
- Definir operador morfologico a ser usado
