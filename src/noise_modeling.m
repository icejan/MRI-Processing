%% Salt and Pepper Noise
I0 = imread('brain_mri.jpg');
noise_density=0.1;
I1 = imnoise(I0,"salt & pepper",noise_density);
figure('color','white');
subplot(2,1,1);
imshow(I0);
title('I0: MRI Image');

subplot(2,1,2);
imshow(I1);
title({'I1: Salt and Pepper Noise','in MRI Image (d=0.1)'});

%% Thermal Noise
%% Gaussian Noise