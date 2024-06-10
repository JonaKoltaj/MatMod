function A = blocna (n)
    v1 = zeros(1,n) - 4;
    v2 = ones(1, n-1);
    T = diag(v1) + diag(v2, 1) + diag(v2, -1);
    v = ones(1,n^2 - 3);
    A = diag(v, n) + diag(v, -n);
    for i = 1:n
        A((i-1)*n + 1:i*n, (i-1)*n + 1:i*n) = T;
    end