function [ pim, dim ] = MakeDichromatIms( im )
%MAKEDICHROMATIMS 
%   Input 
%   im : a color image
%   Output
%   pim : the image seen in Protan space
%   dim : the image seen in Deutan space

[x, y, c] = size(im);
R = double(im(:, :, 1));
G = double(im(:, :, 2));
B = double(im(:, :, 3));

%% 1 - Transform the original (R, G, B)
r = (R/255).^(2.2);
g = (G/255).^(2.2);
b = (B/255).^(2.2);

%% 2 - Reduce the colour domain
% Protanopes
pr1 = 0.992052 * r + 0.003974;
pg1 = 0.992052 * g + 0.003974;
pb1 = 0.992052 * b + 0.003974;

% Deuteranopes
dr1 = 0.957237 * r + 0.0213814;
dg1 = 0.957237 * g + 0.0213814;
db1 = 0.957237 * b + 0.0213814;

%% 3 - Create Matrix M for LMS representation
M = [ 17.8824, 43.5161, 4.11935;
      3.45565, 27.1554, 3.86714;
      0.0299566, 0.184309, 1.46709];
  
%% 4 - Reduce the domain colour to LMS representation
P = [ 0, 2.02344, -2.52581;
      0, 1, 0;
      0, 0, 1];
D = [ 1, 0, 0;
      0.494207, 0, 1.24827;
      0, 0, 1];
  
%% 5 - Apply the transformation
ess = inv(M) * P * M * [pr1(:)'; pg1(:)';pb1(:)'];
rp = reshape(ess(1, :), x, y); 
gp = reshape(ess(2, :), x, y); 
bp = reshape(ess(3, :), x, y); 
ess = inv(M) * D * M * [dr1(:)'; dg1(:)';db1(:)'];
rd = reshape(ess(1, :), x, y); 
gd = reshape(ess(2, :), x, y); 
bd = reshape(ess(3, :), x, y); 

%% 6 - Invert first step
Rp = 255*( rp.^(1/2.2) );
Gp = 255*( gp.^(1/2.2) );
Bp = 255*( bp.^(1/2.2) );

Rd = 255*( rd.^(1/2.2) );
Gd = 255*( gd.^(1/2.2) );
Bd = 255*( bd.^(1/2.2) );

pim = zeros(x, y, c);
pim(:, :, 1) = Rp;
pim(:, :, 2) = Gp;
pim(:, :, 3) = Bp;
pim = uint8(pim);

dim = zeros(x, y, c);
dim(:, :, 1) = Rd;
dim(:, :, 2) = Gd;
dim(:, :, 3) = Bd;
dim = uint8(dim);

end

