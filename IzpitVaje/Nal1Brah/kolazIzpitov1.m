format("long")

a = 96;
g = 9.8;
A1 = [0;5];
A2 = [8;2+a/100];
[x,y,theta] = brahistohrona(A1,A2);
% risi_brah(A1,A2,100)

%1.1
t = cas_potovanja_brah(A1,A2);

%1.2
b = A2(1)- A1(1);
k = sqrt(2*b/(theta - sin(theta)));
dx = @(fi) (k^2).*(1 - cos(fi))./2;
dy = @(fi) - (k^2).*sin(fi)./2;
fun = @(fi) dy(fi)./dx(fi) + 3/4;
fi34 = fzero(fun,2);
ordinata34 = y(fi34) + A1(2);

%1.3
fimin = fminbnd(y,0,theta);
M = [x(fimin)+A1(1);y(fimin)+A1(2)];
% plot(M(1),M(2),'o')
syms a b c
eqn1 = 0 == a*A1(1)^2 + b*A1(1) + c;
eqn2 = A2(2)-A1(2) == a*A2(1)^2 + b*A2(1) + c;
eqn3 = M(2)-A1(2) == a*M(1)^2 + b*M(1) + c;
S = solve([eqn1,eqn2,eqn3]);
f = @(x) double(S.a).*x.^2+double(S.b).*x+double(S.c);
% x = linspace(0,8);
% plot(x,f(x))
fun = @(x) sqrt((1+(2.*double(S.a).*x+double(S.b)).^2)./(-2.*g.*f(x)));
t_param = integral(fun,0,A2(1));