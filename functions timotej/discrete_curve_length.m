function l = discrete_curve_length(X)
    dx = X(1,2:end) - X(1,1:end-1);
    dy = X(2,2:end) - X(2,1:end-1);
    l = sum(sqrt(dx.^2 + dy.^2));
end

