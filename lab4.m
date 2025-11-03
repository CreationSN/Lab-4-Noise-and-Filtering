

close all; clear; clc;

I = im2double(rgb2gray(imread('peppers.png'))); 
figure; imshow(I); title('Original Grayscale Image');

I_gauss = imnoise(I, 'gaussian', 0, 0.01);     
I_sp    = imnoise(I, 'salt & pepper', 0.05);    

figure;
montage({I, I_gauss, I_sp}, 'Size', [1 3]);
title('Original | Gaussian Noise | Salt & Pepper Noise');

MSE_gauss = immse(I_gauss, I);
MSE_sp = immse(I_sp, I);
SNR_gauss = snr(I, I - I_gauss);
SNR_sp = snr(I, I - I_sp);

fprintf('\n=== Noise Metrics ===\n');
fprintf('Gaussian Noise:  MSE = %.4f | SNR = %.2f dB\n', MSE_gauss, SNR_gauss);
fprintf('Salt & Pepper:   MSE = %.4f | SNR = %.2f dB\n\n', MSE_sp, SNR_sp);

h_avg = fspecial('average', 3);                 
I_avg_gauss = imfilter(I_gauss, h_avg, 'replicate');
I_avg_sp = imfilter(I_sp, h_avg, 'replicate');

h_gauss = fspecial('gaussian', [3 3], 0.7);     
I_gauss_gauss = imfilter(I_gauss, h_gauss, 'replicate');
I_gauss_sp = imfilter(I_sp, h_gauss, 'replicate');

I_med_gauss = medfilt2(I_gauss, [3 3]);
I_med_sp = medfilt2(I_sp, [3 3]);

figure;
montage({I_avg_sp, I_med_sp, I_avg_gauss, I_med_gauss}, 'Size', [2 2]);
title('Top: Avg vs Median (S&P) | Bottom: Avg vs Median (Gaussian)');

figure;
montage({I_gauss_gauss, I_gauss_sp}, 'Size', [1 2]);
title('Gaussian Filter: Left=Gaussian Noise | Right=S&P Noise');

MSE_avg_sp = immse(I_avg_sp, I);
MSE_med_sp = immse(I_med_sp, I);
MSE_avg_gauss = immse(I_avg_gauss, I);
MSE_med_gauss = immse(I_med_gauss, I);

fprintf('=== Post-Filtering Metrics ===\n');
fprintf('Salt & Pepper -> Mean Filter:   MSE = %.4f\n', MSE_avg_sp);
fprintf('Salt & Pepper -> Median Filter: MSE = %.4f\n', MSE_med_sp);
fprintf('Gaussian -> Mean Filter:        MSE = %.4f\n', MSE_avg_gauss);
fprintf('Gaussian -> Median Filter:      MSE = %.4f\n\n', MSE_med_gauss);