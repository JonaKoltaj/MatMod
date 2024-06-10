%a
t = linspace(0,5,200);
y0 = 1;
dy = @(t,y) 2*t;
[t,y] = ode45(dy, t, y0);
% f je tocna resitev
f = @(t) t.^2 + 1;
figure
hold on
plot(t,y,'-')
plot(t,f(t),'o')
hold off

%b
Y0 = [1;0];
ddy = @(t,y1,y2) 6*t;
dY = @(t,Y) [Y(2);ddy(t,Y(1),Y(2))];
[t,Y] = ode45(dY,t,Y0);
% g je tocna resitev
g = @(t) t.^3 + 1;
figure
hold on
plot(t,Y(:,1),'-')
plot(t,g(t),'o')
