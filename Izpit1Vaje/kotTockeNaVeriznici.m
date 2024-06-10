function alfa = kotTockeNaVeriznici(T1,T2,l,tol,x)
[~,w] = zvVeriznica(T1,T2,l,tol);
A = [x,w(x)];
k1 = ((T1(2)-A(2))/(T1(1)-A(1)));
k2 = ((T2(2)-A(2))/(T2(1)-A(1)));
alfa1 = atan(abs(1/k1));
alfa2 = atan(abs(1/k2));
alfa = alfa1+alfa2;