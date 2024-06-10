function cvet(a,b,n)
    t = linspace(0,2*pi,100);
    x = a*cos(t);
    y = b*sin(t);
    axis equal
    % da se ne vidi osi
    axis off
    % narisimo grafe na isto sliko
    hold on
    plot(x,y);
    for i=1:(n-1)
        fi = i*(2*pi)/n;
        % rotacijska matrika
        M = [cos(fi) -sin(fi);sin(fi) cos(fi)];
        temp = M*[x;y];
        xi = temp(1,:);
        yi = temp(2,:);
        plot(xi,yi);
    end
    hold off
