function [x,y,dx,dy] = pomoznaFunKamera(t)
mKamera = 3;
cKamera = 0.5;
SKamera = 0.05;
g0 = 9.81;
r = 6371000;
fx = @(t,x1,x2,ro,S,m,c) - ((ro*c*S)/(2*m))*x2*abs(x2);
g = @(y) g0*((r/(r+y))^2);
fy = @(t,y1,y2,g,ro,S,m,c) - g - ((ro*c*S)/(2*m))*y2*abs(y2);

tsp = linspace(0,t,10000);
XY0Kamera = [-20;0;10*sqrt(2);10*sqrt(2)];
dXY = @(t,XY) [XY(3);XY(4);fx(t,XY(1),XY(3),ro(XY(2)),SKamera,mKamera,cKamera);fy(t,XY(2),XY(4),g(XY(2)),ro(XY(2)),SKamera,mKamera,cKamera)];
[~,XYKamera] = ode23s(dXY,tsp,XY0Kamera);

x = XYKamera(end,1);
y = XYKamera(end,2);
dx = XYKamera(end,3);
dy = XYKamera(end,4);
