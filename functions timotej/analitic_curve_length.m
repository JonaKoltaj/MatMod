function l = analitic_curve_length(dy,a,b)
    % explicitly for y' = dy/dx
    ds = @(x) sqrt(1+(dy(x)).^2);
    l = integral(ds, a,b);
end

