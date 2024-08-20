function [x,y,v] = prostiPad(v0,x0,y0,t)
g = 9.81;
vx = v0(1);
vy = v0(2) - g.*t;
v = [vx;vy];
x = v0(1).*t + x0;
y = v0(2).*t -g.*(t.^2)./2 + y0;