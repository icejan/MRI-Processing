%% MRI Image
I0 = imread('brain_mri.jpg');
I0_gray = im2gray(I0);
figure('color','white');
imshow(I0_gray);
%% Salt and Pepper Noise
noise_density=0.1;
I1_0 = imnoise(I0_gray,"salt & pepper",noise_density);
figure('color','white');
imshow(I1_0);

%% Gaussian Noise
sigma = 0.01;
I1_2 = imnoise(I0_gray, 'gaussian', 0, sigma);
imshow(I1_2);
