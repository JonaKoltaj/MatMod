function v = posevniMetv(v0,x,x0)
% Če je v0(1) = 0 pogledamo posebej.
g = 9.81;
t = (x-x0)/v0(1);
vx = v0(1);
vy = v0(2) - g.*t;
v = [vx;vy];
