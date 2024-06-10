function P = mojrand(p,q,a,c,m,x0)
v = zeros(1,p+q);
v(1) = x0/m;
for i=2:p*q
   v(i) = mod(a*v(i-1)*m+c,m)/m;
end
P = reshape(v,p,q);
histogram(P)