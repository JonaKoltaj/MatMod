function p = simetrala_kota(A,B,C)
syms x y
eqns = [norm(A-[x y]) == (norm(A-B)/norm(B-C))*norm(C-[x y]); norm(A-[x y]) + norm(C-[x y]) == norm(A-C)];
D = solve(eqns, [x y]);
if B(1) == D.x
    p = [1, 0, -D.x];
else
    syms k n
    eqns = [B(2) == k*B(1) + n; D.y == k*D.x + n];
    param = solve(eqns, [k n]);
    p = [param.k, -1, param.n];
end