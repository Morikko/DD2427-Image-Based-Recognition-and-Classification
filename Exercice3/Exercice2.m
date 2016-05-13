%% Exercice 2 - Test our linear SVM on the test set
% 25th April 
% MASSERAN Eric

%% Get test set
test_data = load('pedestrian_test');
test_im = test_data.ims;
test_y = test_data.y;
nbr_img = length(test_im);

%% Get hog
Xtest = zeros(features, nbr_img);
for i = 1:nbr_img
    hog = vl_hog(im2single(test_im{1,i}), 4);
    Xtest(:, i) = hog(:);
end

%% Normalize
Xtest = (Xtest - Xtrain_means) / Xtrain_stds;
yy = w' * Xtest + b;
ys = sign(yy);
coeff_test = (nbr_img - sum(ys'~=test_y))/nbr_img;

%% Get an accuracy of 0.89 with only the training set