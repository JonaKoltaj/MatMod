format("long")

g = 9.81;
T0 = [0;5.8];
T1 = [8.3;2];
[x,y,theta] = brahistohrona(T0,T1);
% risi_brah(T0,T1,100)

%2.1
t = cas_potovanja_brah(T0,T1);

%2.2
v = @(fi) sqrt(-2*g*y(fi));
fi3 = fzero(@(fi) y(fi) + T0(2) - 3,2);
v3 = v(fi3);

%2.3
fun = @(y) cas_potovanja_brah([0;y],T1) - 2;
yT0 = fzero(fun,18);
premik = yT0 - T0(2);

%2.4
fimin = fminbnd(y,0,theta);
xmin = x(fimin) + T0(1);
ymin = y(fimin) + T0(2);
tmin = cas_potovanja_brah(T0,[xmin;ymin]);

%2.5
syms a b
ysin = @(x,a,b) a.*sin(x./4) + b;
eqn1 = T0(2) == ysin(T0(1),a,b);
eqn2 = T1(2) == ysin(T1(1),a,b);
S = solve([eqn1 eqn2],[a,b]);
ysinabPrestavljen = @(x) ysin(x,double(S.a),double(S.b))-T0(2);
% tsp = linspace(0,8.3,100);
% plot(tsp,ysinabPrestavljen(tsp)+T0(2))
tsin = cas_potovanja(0,T1(1)-T0(1),ysinabPrestavljen);
ssin = dolzinaKrivulje(0,T1(1)-T0(1),ysinabPrestavljen);
vpovpr = ssin/tsin;




