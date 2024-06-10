% mreza tock
r = linspace(1,2,50);
fi = linspace(0,10*pi,250);
[R,FI] = meshgrid(r,fi);

x = @(r,fi) r.*cos(fi);
y = @(r,fi) r.*sin(fi);
X = x(R,FI);
Y = y(R,FI);
Z = R.*FI;

figure
axis equal
surf(X,Y,Z);
shading interp % izbrisemo crte