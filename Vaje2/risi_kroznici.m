function risi_kroznici(T)
% T= [ x1 y1; x2 y2; x3 y2]
t = linspace(0,2*pi,100);
[S_ocrtana, R] = ocrtana_kroznica(T);
[S_vcrtana, r] = vcrtana_kroznica(T);

x_o = S_ocrtana(1) + R*cos(t);
y_o = S_ocrtana(2) + R*sin(t);
x_v = S_vcrtana(1) + r*cos(t);
y_v = S_vcrtana(2) + r*sin(t);

hold on
plot(x_o,y_o, 'color', 'b')
plot(x_v,y_v, 'color', 'r'); 
axis equal

x = T(:,1);
y = T(:,2);
x(4) = x(1);
y(4) = y(1);
line(x,y,'color','k');

plot(T(:,1), T(:,2), 'o', 'color','k')
plot(S_vcrtana(1),S_vcrtana(2), '*', 'color','r')
plot(S_ocrtana(1),S_ocrtana(2), 'x', 'color','b')
