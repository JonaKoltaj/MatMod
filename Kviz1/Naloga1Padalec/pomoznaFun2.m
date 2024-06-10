function visina = pomoznaFun2(t)
% se uporabi v nalogi 1.3, racunamo cas padanja s padalom
m = 90;
g0 = 9.81;
S = 10.9;
c = 5;
f = @(t,y1,y2,g,ro) - g - ((ro*c*S)/(2*m))*y2*abs(y2);

tsp = linspace(t,400,10000);
[v1,h1] = pomoznaFun1(t);
%zacetno hitrost pa visino gledamo od tuki naprej
Y0 = [v1;h1];
r = 6371000;
g = @(y) g0*((r/(r+y))^2);

dY = @(t,Y) [Y(2);f(t,Y(1),Y(2),g(Y(1)),ro(Y(1)))];

[~,Y] = ode23s(dY,tsp,Y0);
visina = Y(end,1);

% plot(tsp,Y(:,1))
% plot(400,0,'o')
