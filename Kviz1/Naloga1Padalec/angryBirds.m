function [x,y,dx,dy] = angryBirds(t,XY0Ptica)
mPtica = 0.735;
Sptica = 0.024;
cPtica = 0.8;
g0 = 9.81;
r = 6371000;
fx = @(t,x1,x2,ro,S,m,c) - ((ro*c*S)/(2*m))*x2*abs(x2);
g = @(y) g0*((r/(r+y))^2);
fy = @(t,y1,y2,g,ro,S,m,c) - g - ((ro*c*S)/(2*m))*y2*abs(y2);

tsp = linspace(0,t,10000);
dXY = @(t,XY) [XY(3);XY(4);fx(t,XY(1),XY(3),roKviz(XY(2)),Sptica,mPtica,cPtica);fy(t,XY(2),XY(4),g(XY(2)),roKviz(XY(2)),Sptica,mPtica,cPtica)];
[~,XYPtica] = ode23s(dXY,tsp,XY0Ptica);

x = XYPtica(end,1);
y = XYPtica(end,2);
dx = XYPtica(end,3);
dy = XYPtica(end,4);
