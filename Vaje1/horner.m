function b = horner (a,x)
    n = length(a);
    b = a(1);
    for i = 2:n
        b = x*b + a(i);
    end
