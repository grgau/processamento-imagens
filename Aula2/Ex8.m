opt = input('1- Gaussiano, 2- Sal e pimenta: ');

if opt == 1
    I = imread('b.jpg');
%     J = rgb2gray(I);
    p3= 0;
    p4 = 0.05;
    I = im2double(I);
    b = I + sqrt(p4)*randn(size(I)) + p3;
    imshow(b)
elseif opt == 2
    I = imread('b.jpg');
%     J = rgb2gray(I);
    p3= 0.5;
    x = rand(size(I));
    d = find(x < p3/2);
    I(d) = 0; % Minimum value
    d = find(x >= p3/2 & x < p3);
    I(d) = 1; % Maximum (saturated) value
    imshow(I)
end