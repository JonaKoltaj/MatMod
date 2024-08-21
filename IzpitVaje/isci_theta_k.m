function [k,theta] = isci_theta_k(b,B)
% T1(0,0), T2(b,B)
% k konstanta ki doloca brahistohrono
% theta ki ga dobimo je theta* (torej koncni theta)
f = @(x) 1 - cos(x) + B*(x - sin(x))/b;
theta = fzero(f,pi);
k = sqrt(2*b/(theta - sin(theta)));