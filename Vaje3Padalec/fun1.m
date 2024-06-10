function hitrost = fun1(t)
c = 1;
m = 105;
S = 1.2;
g0 = 9.81;
f = @(t,y1,y2,g,ro) - g - ((ro*c*S)/(2*m))*y2*abs(y2);

tsp = linspace(0,300,10000);
Y0 = [40000;0];
r = 6371000;
g = @(y) g0*((r/(r+y))^2);

visine = [0 2000 4000 6000 8000 10000 15000 20000 25000 30000 40000];
gostote = [1.225 1.007 0.8194 0.6601 0.5258 0.4135 0.1948 0.08891 0.04008 0.01841 0.003996];
fun = @(x) [ones(size(x)); x.^2; x.^4];
fun2 = @(y) fun((y - 40000)/40000);
A = fun2(visine);
koef = (A.')\(gostote.');
roz = @(y) polyval([koef(3), 0, koef(2), 0, koef(1)], (y - 40000)/40000);
dY3 = @(t,Y) [Y(2);f(t,Y(1),Y(2),g(Y(1)),roz(Y(1)))];

sol = ode45(dY3,tsp,Y0);
y = deval(sol,t); % ko das not t ti da dva doubla, prvi za visino, drugi za hitrost
hitrost = y(2);