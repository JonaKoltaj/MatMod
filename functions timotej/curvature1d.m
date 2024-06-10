function k = curvature1d(dy, ddy)
    % for curve of form y = y(x) (non implicit)
    k = @(x) ddy(x) / (1 + dy(x)^2)^(3/2);
end

