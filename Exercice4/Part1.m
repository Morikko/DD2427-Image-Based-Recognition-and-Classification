%% Part 1 - Learn linear separating hyperplane for a CovNet representation

l = 18;
net.layers(l);

training_im = inria_train.ims;
training_y = inria_train.labels;
nbr_img = length(training_im);
features = 4096;

%% Find hog features
Xtrain = zeros(features, nbr_img);
for i = 1:nbr_img
    disp([ i nbr_img]);
    im_ = single(training_im{1,i}) ; % note: 0-255 range
    im_ = imresize(im_, net.meta.normalization.imageSize(1:2)) ;
    im_ = im_ - net.meta.normalization.averageImage ;
    
    res = vl_simplenn(net, im_);
    rep = squeeze(gather(res(l+1).x));
    
    Xtrain(:, i) = rep(:);
    clc;
end

%% Pegasos Algorithm
[w, b] = TrainSVM(Xtrain, training_y, 0.0001, 60);
yy = w' * Xtrain + b;
ys = sign(yy);
coeff_train = (nbr_img - sum(ys'~=training_y))/nbr_img;

% Coeff of ~0.97 :)