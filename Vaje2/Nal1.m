%a
f = @(x) sin(x).*exp(sqrt(x));
t = linspace(1,3,200);
plot(t,f(t))

%b
g1 = @(t) cos(t);
g2 = @(t) sin(t);
t = linspace(0,2*pi,200);
figure
plot(g1(t),g2(t))
axis equal

%c
t = linspace(0,10*pi,1000);
figure
plot3(g1(t),g2(t),t)

%d
k = @(x,y) (x.^2+y.^2)./(1+x+y);
x = linspace(0,1,20);
y = linspace(0,1,20);
[X,Y]=meshgrid(x,y);
figure
surf(X,Y,k(X,Y))