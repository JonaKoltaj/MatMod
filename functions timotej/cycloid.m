function X = cycloid(A,B,n,t2)
    if nargin <3, n = 1000; end
    [k,t0] = cycloid_params(A,B);
    if nargin <4, t2 = t0; end

    t = linspace(0,t2,n);

    x = 1/2 * k^2 .* (t - sin(t));
    y = -1/2 * k^2 .* (1-cos(t));

    X = [x;y]+A;
end

function [k,t0] = cycloid_params(A,B)
    b = B(1)-A(1);
    B = B(2)-A(2);
    
    h = @(t) 1 - cos(t) + B/b * (t - sin(t));
    t0 = fzero(h, 1);
    
    k = sqrt(2*b / (t0 - sin(t0)));
end