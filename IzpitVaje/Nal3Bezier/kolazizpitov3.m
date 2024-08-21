c = 96;
b = [2, 3+c/100, 9/2, 5; 0, 3/2, 1, -1];
plotBezier(b,'red','black')

%3.1
k = @(t) curvatureBezier(b,t);
k(0.5)

%3.2
koef = (b(2,4)-b(2,1))/(b(1,4)-b(1,1));
db = bezierDerivative(b);
dx = @(t) deCasteljau(db(1,:),t);
dy = @(t) deCasteljau(db(2,:),t);
fun = @(t) dy(t)/dx(t) - koef;
t0 = fsolve(fun,0.5)