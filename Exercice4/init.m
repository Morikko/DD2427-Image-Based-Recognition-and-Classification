%% Load all the files necessary for the lab
% MASSERAN Eric
% 26th April 2016

run ~/tmp/matconvnet-1.0-beta19/matlab/vl_setupnn

net = load('imagenet-vgg-f');
l = 18;
net.layers(l);

inria_train = load('inria_train');
inria_test = load('inria_test');