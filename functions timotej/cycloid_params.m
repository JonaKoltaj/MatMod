function [k,t0] = cycloid_params(A,B)
    b = B(1)-A(1);
    B = B(2)-A(2);
    
    h = @(t) 1 - cos(t) + B/b * (t - sin(t));
    t0 = fzero(h, 1);
    
    k = sqrt(2*b / (t0 - sin(t0)));
end
