function y = posevniMet(v0,x0,y0,x)
% Funkcija za posevni met, ki izrazi y z x-om.
% Tukaj v0(1) ~= 0, saj je potem x konstantno x0
g = 9.81; 
t = (x-x0)/v0(1);
y = v0(2).*t -g.*(t.^2)./2 + y0;