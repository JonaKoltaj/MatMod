function t = discrete_curve_time(X,g)
    t = 0;
    v = 0;
    for i = 1:size(X,2)-1
        [v,t1] = time_and_velocity_for_line(X(:,i),X(:,i+1),v,g);
        t = t + t1;
    end
end

function [v,t] = time_and_velocity_for_line(A,B,v0,g)
    if nargin <4, g = -9.81; end
    if nargin <3, v0 = 0; end
    s = d(A,B);
    phi = atan2(B(2)-A(2),B(1) - A(1));
    a = g * sin(phi);
    v = sqrt(v0^2 + 2 * a * s);
    t = (v-v0)/a;
    if isnan(t)
        t = s/v;
    end
end