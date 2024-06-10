c = 1;
m = 105;
S = 1.2;
g0 = 9.81;
f = @(t,y1,y2,g,ro) - g - ((ro*c*S)/(2*m))*y2*abs(y2);

%1
ro1 = 1.225;
t = linspace(0,300,10000);
Y0 = [40000;0];
dY1 = @(t,Y) [Y(2);f(t,Y(1),Y(2),g0,ro1)];
[t,Y1] = ode45(dY1,t,Y0);
povprecna1 = mean(Y1(:,2))
figure
hold on
plot(t,-Y1(:,2),'r')

%2
koncna1 = Y1(end,2)

%3
r = 6371000;
g = @(y) g0*((r/(r+y))^2);
dY2 = @(t,Y) [Y(2);f(t,Y(1),Y(2),g(Y(1)),ro1)];
[t,Y2] = ode45(dY2,t,Y0);
visina300 = Y2(end,1)
plot(t,-Y2(:,2),'b')
 
%4
visine = [0 2000 4000 6000 8000 10000 15000 20000 25000 30000 40000];
gostote = [1.225 1.007 0.8194 0.6601 0.5258 0.4135 0.1948 0.08891 0.04008 0.01841 0.003996];
fun = @(x) [ones(size(x)); x.^2; x.^4];
fun2 = @(y) fun((y - 40000)/40000);
A = fun2(visine);
koef = (A.')\(gostote.');
roz = @(y) polyval([koef(3), 0, koef(2), 0, koef(1)], (y - 40000)/40000);
dY3 = @(t,Y) [Y(2);f(t,Y(1),Y(2),g(Y(1)),roz(Y(1)))];
[t,Y3] = ode45(dY3,t,Y0);
visina300gost = Y3(end,1)
plot(t,-Y3(:,2),'y')

%5
[t, Y4] = ode45(dY3, t, [40000, -3]);
brez_odriva = Y3(30, 2);
z_odrivom = Y4(30, 2);
razlika = z_odrivom - brez_odriva

%6
fun2 = @(x) fun1(x) + 300;
cas300 = fzero(fun2,35) % to sm sam pac uganla da je x0, kr je tm bliz
