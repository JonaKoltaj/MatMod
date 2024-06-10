function plotBezier(X, n)
    x = X(1,:);
    y = X(2,:);
    plot(x,y,'o-', linewidth=2);
    t = linspace(0,1,n);
    X = deCasteljau(x,t);
    Y = deCasteljau(y,t);
    plot(X,Y,'r-', linewidth=1)
end