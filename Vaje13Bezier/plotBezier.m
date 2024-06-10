function plotBezier(b,barvaPoligon,barvaKrivulja)
% b = [bx;by]
t = linspace(0,1);
fx = deCasteljau(b(1,:),t);
fy = deCasteljau(b(2,:),t);
hold on
for i=1:length(b)
    plot(b(1,i),b(2,i),'o')
end
plot(b(1,:),b(2,:),barvaPoligon)
plot(fx,fy,barvaKrivulja)
axis equal