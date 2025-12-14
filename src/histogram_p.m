% ============================================================
% MRI Image Denoising and Histogram Equalization
% ============================================================

clc;
clear;
close all;

% ----------------------------
% Step 1: Read Input Image
% ----------------------------
% Replace with your own MRI image
img = imread('mri_image.jpg');

% Convert to grayscale if RGB
if size(img,3) == 3
    img = rgb2gray(img);
end

% Convert to double precision
img = im2double(img);

% ----------------------------
% Step 2: Add Noise (Optional)
% ----------------------------
% Simulates realistic MRI noise
% Comment this out if image is already noisy
noisy_img = imnoise(img, 'gaussian', 0, 0.01);

% ----------------------------
% Step 3: Denoising
% ----------------------------
% Gaussian filter as baseline denoising method
sigma = 1;
denoised_img = imgaussfilt(noisy_img, sigma);

% ----------------------------
% Step 4: Histogram Equalization
% ----------------------------
% Contrast enhancement
histeq_img = histeq(denoised_img);

% ----------------------------
% Step 5: Display Images (Vertical Layout)
% ----------------------------
figure('Name','MRI Image Processing Pipeline','NumberTitle','off');

subplot(3,1,1)
imshow(img, [])
title('Original MRI Image')

subplot(3,1,2)
imshow(denoised_img, [])
title('Denoised MRI Image')

subplot(3,1,3)
imshow(histeq_img, [])
title('Histogram Equalized MRI Image')

% ----------------------------
% Step 6: Display Histograms (Vertical Layout)
% ----------------------------
figure('Name','Histogram Comparison','NumberTitle','off');

subplot(3,1,1)
imhist(img)
title('Histogram of Original MRI Image')

subplot(3,1,2)
imhist(denoised_img)
title('Histogram of Denoised MRI Image')

subplot(3,1,3)
imhist(histeq_img)
title('Histogram of Equalized MRI Image')

% ----------------------------
% Step 7: Quantitative Metrics
% ----------------------------
% Mean intensity values
mean_original = mean(img(:));
mean_denoised = mean(denoised_img(:));
mean_equalized = mean(histeq_img(:));

fprintf('Mean Intensity Values:\n');
fprintf('Original Image: %.4f\n', mean_original);
fprintf('Denoised Image: %.4f\n', mean_denoised);
fprintf('Equalized Image: %.4f\n', mean_equalized);

% Average pixel differences
diff_denoised = mean(abs(img(:) - denoised_img(:)));
diff_equalized = mean(abs(img(:) - histeq_img(:)));

fprintf('\nAverage Pixel Difference:\n');
fprintf('Original vs Denoised: %.4f\n', diff_denoised);
fprintf('Original vs Equalized: %.4f\n', diff_equalized);

% ============================================================
% End of Script
% ============================================================
