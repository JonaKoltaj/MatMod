format("long")

c0 = 1; %koef zracnega upora
m0 = 90; %masa padalca
S0 = 0.9; %povrsina padalca
g0 = 9.81;
r = 6371000; %radij zemlje
Y0 = [40000;0]; %zacetna visina
g = @(y) g0*((r/(r+y))^2);
f = @(t,y1,y2,g,ro,S,m,c) - g - ((ro*c*S)/(2*m))*y2*abs(y2);

%1.1
t1 = linspace(0,25,10000);
dY1 = @(t,Y) [Y(2);f(t,Y(1),Y(2),g(Y(1)),ro(Y(1)),S0,m0,c0)];
[t1,Y1] = ode23s(dY1,t1,Y0);

pot25s = Y1(end,1);
prepotovano25s = 40000 - pot25s;

%1.2
m1 = 190;
c1 = 1.1;
S1 = 1;
t2 = linspace(0,60,10000);
dY2 = @(t,Y) [Y(2);f(t,Y(1),Y(2),g(Y(1)),ro(Y(1)),S1,m1,c1)];
[t2,Y2] = ode23s(dY2,t2,Y0);

[t2,Y12] = ode23s(dY1,t2,Y0);

hitrostBrez60s = Y12(end,2);
hitrostZ60s = Y2(end,2);
hitrost60s = abs(hitrostZ60s - hitrostBrez60s);

%1.3
fun = @(t) pomoznaFun2(t);
%uganimo zacetni priblizek 374
topt = fzero(fun,374);

%1.4
fun2 = @(t) pomoznaFun3(t);
tgladina = fzero(fun2,6);
[visinaGladina,hitrostGladina] = fun2(tgladina);

%1.5
mKamera = 3;
cKamera = 0.5;
SKamera = 0.05;
t3 = linspace(0,100,10000);
% [x y x' y'] = [x1 y1 x2 y2]
XY0 = [0;40000;10;0];
fx = @(t,x1,x2,ro,S,m,c) - ((ro*c*S)/(2*m))*x2*abs(x2);
% dxy = [x' y' x'' y''] = [x2 y2 fx f] 
dXY = @(t,XY) [XY(3);XY(4);fx(t,XY(1),XY(3),ro(XY(2)),SKamera,mKamera,cKamera);f(t,XY(2),XY(4),g(XY(2)),ro(XY(2)),SKamera,mKamera,cKamera)];
[t3,XY] = ode23s(dXY,t3,XY0);
horizPot = XY(end,1);

% figure
% plot(XY(:,1),XY(:,2))
% axis equal

%1.6
funKamera = @(t) pomoznaFunKamera(t);
tPK = fzero(funKamera,2);
[xP,yP,dxP,dyP] = pomoznaFunKamera(tPK);
funFelix = @(t) pomoznaFun3(t) - yP;
tPF = fzero(funFelix,5);
tZamik = tPF - tPK;



