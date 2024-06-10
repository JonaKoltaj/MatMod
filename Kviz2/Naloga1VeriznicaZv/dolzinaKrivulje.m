function s = dolzinaKrivulje(a,b,f)
% sprejme funkcijo f in meji a in b, in zracuna dolzino grafa
syms x
fun = matlabFunction(sqrt(1 + diff(f(x),x).^2));
s = integral(fun,a,b);