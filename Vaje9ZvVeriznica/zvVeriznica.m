function [T_min,w] = zvVeriznica(obesisceL,obesisceD,l,tol)
% T_min najnizja tocka veriznice
% w funkcija visine veriznice v tocki x
z = zvVeriznica_iteracijskaFun(obesisceL,obesisceD,l,1,tol);
u = atanh((obesisceD(2)-obesisceL(2))/l) - z;
v = atanh((obesisceD(2)-obesisceL(2))/l) + z;
C = (obesisceD(1)-obesisceL(1))/(v-u);
D = (obesisceL(1)*v-obesisceD(1)*u)/(v-u);
lambda = obesisceD(2)-C*cosh(v);

w = @(x) lambda + C*cosh((x-D)/C);
x_min = fminbnd(w,obesisceL(1),obesisceD(1));
T_min = [x_min; w(x_min)];

x = linspace(obesisceL(1), obesisceD(1));
figure
hold on
plot(x,w(x))
plot(T_min(1),T_min(2),'o')