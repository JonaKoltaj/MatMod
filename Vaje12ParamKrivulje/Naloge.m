X = @(t) -cos(t)+2.*cos(t./2);
Y = @(t) -sin(t)+2.*sin(t./2);
tsp = linspace(0,4*pi);
figure
hold on
% plot(X(tsp),Y(tsp))
% axis equal

%1
T = [X(1),Y(1)];
dolzina = norm(T,2);

%2
syms ts
fun = matlabFunction(sqrt(diff(X(ts)).^2 + diff(Y(ts)).^2));
L = integral(fun,0,4*pi);

%3
fun2 = matlabFunction(X(ts).*diff(Y(ts)) - diff(X(ts)).*Y(ts));
S = (integral(fun2,0,4*pi))/2;

%4
funzg = matlabFunction(diff(X(ts)).*diff(diff(Y(ts))) - diff(Y(ts)).*diff(diff(X(ts))));
funsp = matlabFunction((diff(X(ts)).^2 + diff(Y(ts)).^2).^(3/2));
ukrivljenost2pi = funzg(2*pi)/funsp(2*pi);

%5
fun = @(t) X(t) + Y(t);
t1 = fzero(fun,5);
t2 = fzero(fun,9);
P1 = [X(t1);Y(t1)];
P2 = [X(t2);Y(t2)];
% plot(linspace(-3,3),-linspace(-3,3))
% plot(P1(1),P1(2),'o')
% plot(P2(1),P2(2),'o')

%6
X2 = @(t) t.*cos(t)./4;
Y2 = @(t) t.*sin(t)./4;
tsp2 = linspace(0,3*pi);
% plot(X2(tsp2),Y2(tsp2))
funX = @(t1,t2) X(t1) - X2(t2);
funY = @(t1,t2) Y(t1) - Y2(t2);
fun2 = @(t1,t2) [funX(t1,t2), funY(t1,t2)];
plot(funX(tsp,tsp2),funY(tsp,tsp2))
fsolve(fun2,[3*pi/4, 9*pi/4]) %screaming crying
