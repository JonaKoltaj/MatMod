function y = posevniMet(v0,x0,y0,x)
% Funkcija, ki izračuna pozicijo žogice pri poševnem metu, v odvisnosti od
% koordinate x. Pri tem upoštevamo, da v0(1) ni 0, saj tak primer
% obravavamo posebej. Takrat je tudi x potem konstantno x0.
g = 9.81; 
t = (x-x0)/v0(1);
y = v0(2).*t -g.*(t.^2)./2 + y0;