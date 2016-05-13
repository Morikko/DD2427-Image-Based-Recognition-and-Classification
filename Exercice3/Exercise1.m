%% Exercise 1 - The Pegasos Algorithm - training an SVM with SGD
% 25th April 2016
% MASSERAN Eric
clc;
clear;
close all;

features = 1395;

%% Extract data
training_data = load('pedestrian_training');
training_im = training_data.ims;
training_y = training_data.y;
nbr_img = length(training_im);

%% Find hog features
Xtrain = zeros(features, nbr_img);
for i = 1:nbr_img
    hog = vl_hog(im2single(training_im{1,i}), 4);
    Xtrain(:, i) = hog(:);
end

%% Normalize
Xtrain_means = sum(mean(Xtrain))/nbr_img;
Xtrain_stds = sum(std(Xtrain))/nbr_img;
%Xtrain_norm = zscore(Xtrain);
Xtrain_norm = (Xtrain - Xtrain_means)/ Xtrain_stds;


%% Pegasos Algorithm
[w, b] = TrainSVM(Xtrain_norm, training_y, 0.0001, nbr_img);
yy = w' * Xtrain_norm + b;
ys = sign(yy);

coeff_train = (nbr_img - sum(ys'~=training_y))/nbr_img;
training_loss = sum(sqrt(power(yy - training_y', 2)))/nbr_img;

% I get a training coefficient of 96.2%
% A training loss of 219.188