% ============================================================
% NORDIC-Style MRI Denoising Using PCA (Approximation)
% ============================================================

clc;
clear;
close all;

% ----------------------------
% Step 1: Read MRI Image
% ----------------------------
img = imread('mri_image.jpg');

if size(img,3) == 3
    img = rgb2gray(img);
end

img = im2double(img);

% ----------------------------
% Step 2: Add Noise (Optional)
% ----------------------------
noisy_img = imnoise(img, 'gaussian', 0, 0.01);

% ----------------------------
% Step 3: PCA-Based Denoising
% ----------------------------
% Reshape image into 2D matrix
[m, n] = size(noisy_img);
X = reshape(noisy_img, m, n);

% Perform PCA using SVD
[U, S, V] = svd(X, 'econ');

% Keep only top principal components
k = 30;  % Number of components retained
X_denoised = U(:,1:k) * S(1:k,1:k) * V(:,1:k)';

% ----------------------------
% Step 4: Display Results
% ----------------------------
figure('Name','NORDIC-Style PCA Denoising','NumberTitle','off');

subplot(2,1,1)
imshow(noisy_img, [])
title('Noisy MRI Image')

subplot(2,1,2)
imshow(X_denoised, [])
title('MRI Image After PCA-Based (NORDIC-Style) Denoising')

% ============================================================
% End of Script
% ============================================================
