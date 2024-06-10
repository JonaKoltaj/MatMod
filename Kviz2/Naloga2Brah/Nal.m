format("long")

g = 9.81;
T0 = [1;5];
T1 = [6;2];
[x,y,theta] = brahistohrona(T0,T1);
risi_brah(T0,T1,100)

%2.1
t_brah = cas_potovanja_brah(T0,T1);

%2.2
T05 = [3;2];
B = T05(2) - T0(2);
b = T05(1)- T0(1);
koef = B/b;
t_premica1 = 2*sqrt((1+koef^2)*b/(-2*g*koef));
v05 = sqrt(2*g*(T0(2)-T05(2)));
% od tocke T05 do T1 bo mela isto hitrost kr gre samo vodoravno
t_premica2 = (T1(1)-T05(1))/v05;
t_premica = t_premica1 + t_premica2;

%2.3
v = @(fi) sqrt(-2*g*y(fi));
fi = linspace(0,theta,100);
max_hitrost = max(v(fi));

%2.4
syms th
eqn = sqrt(2*x(th)/(2*g*(th - sin(th))))*th == 1.5;
theta2 = solve(eqn,th);
T2 = [x(theta2)+T0(1);y(theta2)+T0(2)];
norma = norm(T2);

%2.5
k = sqrt(2*b/(theta - sin(theta)));
dx = @(fi) (k^2).*(1 - cos(fi))./2;
dy = @(fi) - (k^2).*sin(fi)./2;
alfa = atan(dy(theta)/dx(theta));
v0 = v(theta);
%smo zracunali vekt hitrosti na koncu
%zdej pa basically posevni met
x_posevni = @(t) v0.*cos(alfa).*t + T1(1);
y_posevni = @(t) v0.*sin(alfa).*t - (g.*t.^2)./2 + T1(2);
t0 = fzero(y_posevni,1);
abscisa = x_posevni(t0)
t = linspace(0,t0,100);
plot(x_posevni(t),y_posevni(t))
