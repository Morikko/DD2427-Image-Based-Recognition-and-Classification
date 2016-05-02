%% Exercice 3 - Test our model on the test set
% 26th April 
% MASSERAN Eric

%% Get test set
test_im = inria_test.ims;
test_y = inria_test.labels;
nbr_img = length(test_im);
features = 4096;

%% Find hog features
Xtest = zeros(features, nbr_img);
for i = 1:nbr_img
    disp([ i nbr_img]);
    im_ = single(test_im{1,i}) ; % note: 0-255 range
    im_ = imresize(im_, net.meta.normalization.imageSize(1:2)) ;
    im_ = im_ - net.meta.normalization.averageImage ;
    
    res = vl_simplenn(net, im_);
    rep = squeeze(gather(res(l+1).x));
    
    Xtest(:, i) = rep(:);
    clc;
end

%% Normalize
%Xtest = (Xtest - Xtrain_means) / Xtrain_stds;

yy = w' * Xtest + b;
ys = sign(yy);
coeff_test = (nbr_img - sum(ys'~=test_y))/nbr_img;

%% Get an accuracy of 0.96