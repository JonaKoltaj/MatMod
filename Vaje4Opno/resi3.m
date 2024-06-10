function x = resi3 (a,b,c,f)
    n = length(b);
    x = zeros(1,n);
    for i=1:(n-1)
        b(i+1) = b(i+1) - (a(i)/b(i))*c(i);
        f(i+1) = f(i+1) - (a(i)/b(i))*f(i);
    end
    x(n) = f(n)/b(n);
    for i=(n-1):-1:1
        x(i) = (1/b(i))*(f(i)-c(i)*x(i+1));
    end