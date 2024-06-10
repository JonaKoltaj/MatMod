function y_min = pomoznaFun1(l)
% uporabljena v 1.3
% racuna y_min v odvisnosti od dolzine veriznice
A = [0;20];
B = [10;15];
tol = 10^(-16);

z = zvVeriznica_iteracijskaFun(A,B,l,1,tol);
u = atanh((B(2)-A(2))/l) - z;
v = atanh((B(2)-A(2))/l) + z;
C = (B(1)-A(1))/(v-u);
D = (A(1)*v-B(1)*u)/(v-u);
lambda = B(2)-C*cosh(v);

w = @(x) lambda + C*cosh((x-D)/C);
x_min = fminbnd(w,A(1),B(1));
y_min = w(x_min);