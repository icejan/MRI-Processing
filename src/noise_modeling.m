%% 1.0 Noise Modeling
% MRI Image
I0 = imread('brain_mri.jpg');
I0_gray = im2gray(I0);
figure('color','white');
imshow(I0_gray);

% Salt and Pepper Noise
I1_0 = imnoise(I0_gray,"salt & pepper");
figure('color','white');
imshow(I1_0);

% Gaussian Noise
sigma = 0.01;
I1_1 = imnoise(I0_gray, 'gaussian', 0, sigma);
imshow(I1_1);

%% 2.0 Classical Spatial Filters
% average filter on salt and pepper noise
H1_0 = fspecial('average', [6,6]);
I2_0 = imfilter(I1_0, H1_0, 'replicate');
figure('color','white');
imshow(I2_0);

% average filter on gaussian noise
I2_1 = imfilter(I1_1, H1_0, 'replicate');
figure('color','white');
imshow(I2_0);

% Gaussian Filter removing salt and pepper
sigma2 = 1;
H1_3 = fspecial('gaussian', [5 5], sigma2);
I2_2 = imfilter(I1_0, H1_3, 'replicate');
figure('color','white');
imshow(I2_2);

% Gaussian Filter removing gaussian noise
I2_3 = imfilter(I1_1, H1_3, 'replicate');
figure('color','white');
imshow(I2_3);
