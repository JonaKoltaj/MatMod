A = diag(1:n) + diag(ones(1, n-1), -1) - diag(ones(1, n-2), -2);
for i = 1:n-1
    v = 4 + zeros(1,n-i);
    A = A + diag(v, i);
end