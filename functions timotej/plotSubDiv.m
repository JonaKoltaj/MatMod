function plotSubDiv(X,c,n)
    bx = X(1,:);
    by = X(2,:);
    [X1,X2] = subdiv_points(bx,c);
    [Y1,Y2] = subdiv_points(by,c);
    plot(X1,Y1, 'ro-', X2,Y2, 'mo-', linewidth=2)
    B1 = [X1;Y1];
    B2 = [X2;Y2];
    t = linspace(0,1,n);
    X = deCasteljau(X1,t);
    Y = deCasteljau(Y1,t);
    plot(X,Y,'r-', linewidth=1.5)
    X = deCasteljau(X2,t);
    Y = deCasteljau(Y2,t);
    plot(X,Y,'b-', linewidth=1.5)     
end