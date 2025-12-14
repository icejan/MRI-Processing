% DAMF Technique
% Original Image
I4 = imread('mri_image.jpg');

% Convert to grayscale
if ndims(I4) == 3
    I4 = rgb2gray(I4);
end

% Convert to uint8
I4 = uint8(I4);

% Add salt and pepper noise
noise_density = 0.1;  % 10% density noise level
% tested out 60% density noise level using the line below in replacement of
% 10% density level
% noise_density = 0.6;  % 60% density noise level
noisy_image = imnoise(I4, 'salt & pepper', noise_density);

% Apply DAMF filter
filtered_image = DAMF(noisy_image);

% Display results
figure(1);
imshow(I4);
title('I4: Original MRI Image', "FontSize", 15, "Color", "Black");

figure(2);
imshow(noisy_image);
title('I5: Salt & Pepper Noisy Image', "FontSize", 15, "Color", "Black");

figure(3);
imshow(filtered_image);
title('I6: DAMF Filtered Image', "FontSize", 15, "Color", "Black");

% Saving image outputs
imwrite(noisy_image, 'mri_image_noisy.png');
imwrite(filtered_image, 'mri_image_DAMF_filtered.png');

