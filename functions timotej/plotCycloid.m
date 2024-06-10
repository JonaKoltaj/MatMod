function plotCycloid(A,B,n)
    [~, t0] = cycloid_params(A,B);
    t = linspace(0,t0,n);
    [w,~] = cycloid_analitic(A,B,t);
    x = w(1,:);
    y = w(2,:);
    hold on
    plot(A(1), A(2), 'rx', B(1), B(2), 'rx', linewidth=2)
    plot(x,y, 'b-', LineWidth=1)
end

function [w, dw] = cycloid_analitic(A,B,t)
    if nargin <4, g = 9.81; end
    [k, ~] = cycloid_params(A,B);
    w = 1/2 * k^2 .* [t-sin(t); cos(t)-1] + A;
    dw = 1/2 * k^2 .* [1 - cos(t); -sin(t)];
end