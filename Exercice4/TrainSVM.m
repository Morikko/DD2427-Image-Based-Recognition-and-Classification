function [ w, b ] = TrainSVM( Xtrain, ys, lambda, epochs)
%TRAINSVM Summary of this function goes here
%   Detailed explanation goes here
[d, n] = size(Xtrain);

w = zeros(d, 1); b = 0;

for i = 1:epochs
    inds = randperm(n);
    for t = 1:n
        nt = 1/(lambda*t);
        yt = ys(inds(t));
        xt = Xtrain(:, inds(t));
    
        if ( yt * (w'*xt + b ) < 1 )
            w = (1 - nt*lambda)*w + nt*yt*xt;
            b = b + nt*yt;
        else
            w = (1 - nt*lambda)*w;
            % b keep the same
        end
    end
    % Normalize: optional and expensive
    a = min(1, 1/( norm(w) * sqrt(lambda) ));
    w = a * w;
    b = a * b;
end

