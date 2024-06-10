function A = area_under_curve(f, a, b)
    A = integral(@(x) abs(f(x)), a,b);
end

