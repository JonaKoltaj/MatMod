function [visina,hitrost] = pomoznaFun1(t)
% se uporabi v pomozniFunkciji2, gledamo cas normalnega padanja
m = 90;
g0 = 9.81;
S = 0.9;
c = 1;
f = @(t,y1,y2,g,ro) - g - ((ro*c*S)/(2*m))*y2*abs(y2);

tsp = linspace(0,t,10000);
Y0 = [40000;0];
r = 6371000;
g = @(y) g0*((r/(r+y))^2);

dY = @(t,Y) [Y(2);f(t,Y(1),Y(2),g(Y(1)),ro(Y(1)))];

[~,Y] = ode23s(dY,tsp,Y0);
visina = Y(end,1);
hitrost = Y(end,2);


% figure
% hold on
% plot(tsp,Y(:,1))


