function [w, dw] = cycloid_analitic(A,B,t)
    [k, ~] = cycloid_params(A,B);
    w = 1/2 * k^2 .* [t-sin(t); cos(t)-1] + A;
    dw = 1/2 * k^2 .* [1 - cos(t); -sin(t)];
end

