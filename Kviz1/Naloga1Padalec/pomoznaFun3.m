function [v,h] = pomoznaFun3(t)
% se uporabi v nalogi 1.4
m = 90;
g0 = 9.81;
S = 0.9;
c = 1;
k = 47;
r = 6371000;
g = @(y) g0*((r/(r+y))^2);
f = @(t,y1,y2,g,ro) - g - ((ro*c*S)/(2*m))*y2*abs(y2);
%cappamo off vpliv bungee vrvi, ce smo nad 50m
f2 = @(t,y1,y2,g,ro) f(t,y1,y2,g,ro) + k/m*max([(50-y1),0]);

tsp = linspace(0,t,10000);
Y0 = [100;0];

dY = @(t,Y) [Y(2);f2(t,Y(1),Y(2),g(Y(1)),ro(Y(1)))];

[~,Y] = ode23s(dY,tsp,Y0);
v = Y(end,1);
h = Y(end,2);





