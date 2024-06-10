function t = time_for_brahistochrone(A,B,g)
    if nargin <3, g = 9.8; end
    [k,t0] = cycloid_params(A,B);
    t = k * t0 / sqrt(2*g);
end
