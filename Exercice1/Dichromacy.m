%% Exercice 1 - DD2427 - Dichromacy
% Masseran Eric
% 24th April 2016
% Change image to see them in a dichromacy space

clear;
clc;
close all;

im = imread('Images/Flowers.jpg');
figure(1);
imshow(im);

[pim, dim] = MakeDichromatIms(im);

imwrite(pim, 'pFlowers.png', 'png');
imwrite(dim, 'dFlowers.png', 'png');