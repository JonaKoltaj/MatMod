function p = simetrala(A,B)
% A=[x1,y1], B=[x2,y2]
% p=[a b c] (ax+by+c=0)
S = [(B(1)+A(1))/2, (B(2)+A(2))/2];
if B(2)-A(2) == 0
    p = [1, 0, -S(1)];
else
    k = - (B(1)-A(1))/(B(2)-A(2));
    syms m
    n = solve(S(2) == k*S(1) + m, m);
    p = [k, -1, n];
end