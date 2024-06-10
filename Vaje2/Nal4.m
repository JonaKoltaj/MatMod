f = @(x,y) (sin(x.^2 - y.^4))./(x.^2 - y.^4);
x = 0:.01:1;
y = 0:.01:2;

%a
[X,Y] = ndgrid(x,y);
Z = f(X,Y);
figure
surf(X,Y,Z)
shading interp

%b
Z(isnan(Z))=1;
figure
surf(X,Y,Z)
shading interp
hold on

%c
m = max(max(Z));
locmax = find(Z==m);
plot3(X(locmax),Y(locmax),Z(locmax),'o-')
m = min(min(Z));
locmin = find(abs(Z-m)<10^-5);
plot3(X(locmin),Y(locmin),Z(locmin),'ro-')

%d
syms x y
dx = matlabFunction(diff(f(x,y),x));
dy = matlabFunction(diff(f(x,y),y));
skip = 30;
xxCoarse = X(1:skip:end,1:skip:end);
yyCoarse = Y(1:skip:end,1:skip:end);
zzCoarse = Z(1:skip:end,1:skip:end);
[uu,vv,ww] = sinFun_normalVecFun(xxCoarse,yyCoarse,dx,dy);
quiver3(xxCoarse,yyCoarse,zzCoarse,uu,vv,ww,0.25,'LineWidth',1, 'color', [.2 .5 .2])