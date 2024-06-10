function [Y1,Y2] = sub_demo(b,c)
% b vektor kontrolnih koeficientov
% c je subdivizijski parameter 0 <= c <= 1
m = size(b, 2); %stevilo tock
Y = zeros(m,m);
Y(:,1) = b';
    for i = 2:m
        Y(1:end-1,i) = Y(1:end-1,i-1) * (1-c) + Y(2:end,i-1) * c;
    end
    Y1 = Y(1,:);
    Y2 = Y(m:m-1:end-1); % antidiagonala
