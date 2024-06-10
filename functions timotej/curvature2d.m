function k = curvature2d(dx, ddx, dy, ddy)
    % for parametrised curve [x(t);y(t)] with r' = [x',y'] and r'' =
    % [x'';y'']
    k  = @(t) (dx(t)*ddy(t) - dy(t)*ddx(t))/ (dx(t)^2 + dy(t)^2)^(3/2);
end

