format("long")

b = 61;
l = 16;
T1 = [1;0];
T2 = [5;4+b/100];
tol = 10^(-16);
[P,w] = zvVeriznica(T1,T2,l,tol);
x = linspace(T1(1),T2(1));
% figure
% hold on
% plot(x,w(x))
% plot(T1(1),T1(2),'o')
% plot(T2(1),T2(2),'o')
% plot(P(1),P(2),'x')

%2.1
dolzinaP = dolzinaKrivulje(P(1),T2(1),w);

%2.2
% plot(x,-w(x))
presecisce = fzero(w,4.5);
ploscina1 = - integral(w,1,presecisce);
ploscina2 = integral(w,presecisce,5);
ploscina = 2*ploscina1 + 2*ploscina2;

%2.3
fun = @(x) kotTockeNaVeriznici(T1,T2,l,tol,x);
minkotx = fminbnd(fun,T1(1),T2(1));
% plot([minkotx T1(1)], [w(minkotx) T1(2)])
% plot([minkotx T2(1)], [w(minkotx) T2(2)])

%2.4


