%% Exercice 3 - Use the validation set to search for a good value of lambda

lambda = [0.01, 0.001, 0.0001, 0.00001];
w = zeros(5, 1); b = zeros(5, 1);

for i = 1:length(lambda)
    [w, b] = TrainSVM(Xtrain_norm, training_y, 0.0001, nbr_img);
end

yy = w' * Xtrain_norm + b;
ys = sign(yy);
coeff_train = (nbr_img - sum(ys'~=training_y))/nbr_img;