% Essa funcao recebe uma imagem RGB como entrada, realiza as equacoes de conversao para HSI, e cria no diretorio 'imagens_hsi' a imagem convertida.

function nome_imagem_hsi = rgb2hsi(imagem_rgb)
% Nome da imagem que sera usado para gerar imagem HSI
[~, nome, extensao] = fileparts(imagem_rgb);

% Le a imagem RGB dada como entrada:
imagem_rgb = imread(imagem_rgb);

% Separando os canais da imagem RGB em r (vermelho), g (verde) e b (azul):
rgb = im2double(imagem_rgb);
r = rgb(:, :, 1);
g = rgb(:, :, 2);
b = rgb(:, :, 3);

% Valor de H definido por:
theta = acos((0.5*((r - g) + (r - b)))./((sqrt((r - g).^2 + (r - b).*(g - b))) + eps));
if b > g
    H = (2*pi)-theta;
else
    H = theta;
end

% Valor de S definido por:
S = 1 - 3.* (min(min(r, g), b))./((r + g + b) + eps);

% Valor de I definido por:
I = (r + g + b)/3;

% Criacao da imagem HSI:
imagem_hsi = zeros(size(imagem_rgb));
imagem_hsi(:,:,1) = H;
imagem_hsi(:,:,2) = S;
imagem_hsi(:,:,3) = I;

nome_imagem_hsi = strcat('imagens_hsi/', nome, '_hsi_i', extensao);
imwrite(imagem_hsi(:,:,3), nome_imagem_hsi);
end