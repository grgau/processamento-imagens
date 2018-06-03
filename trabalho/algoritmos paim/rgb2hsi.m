function rgb2hsi(imagem)
[~, nome, extensao] = fileparts(imagem);

A = imread(imagem);
figure,imshow(A);title('RGB Image');
I = double(A)/255;

R=I(:,:,1);
G=I(:,:,2);
B=I(:,:,3);

numi=1/2*((R-G)+(R-B));
denom=((R-G).^2+((R-B).*(G-B))).^0.5;

H=acosd(numi./(denom+0.000001));

H(B>G)=360-H(B>G);

H=H/360;

S=1- (3./(sum(I,3)+0.000001)).*min(I,[],3);

I=sum(I,3)./3;
% Criacao da imagem HSI:
imagem_hsi = zeros(size(A));
imagem_hsi(:,:,1) = H;
imagem_hsi(:,:,2) = S;
imagem_hsi(:,:,3) = I;

nome_imagem_hsi = strcat(nome, '_hsi', extensao);
imwrite(imagem_hsi(:,:,3), nome_imagem_hsi);
HSI=zeros(size(A));
HSI(:,:,1)=H;
HSI(:,:,2)=S;
HSI(:,:,3)=I;

figure,imshow(HSI);title('HSI Image');
end