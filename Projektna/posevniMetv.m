function v = posevniMetv(v0,x,x0)
% Funkcija, ki izračuna vektor hitrosti žogice pri poševnem metu, v
% odvisnosti od koordinate x. Pri tem upoštevamo, da v0(1) ni 0, saj tak
% primer obravavamo posebej. Takrat je tudi x potem konstantno x0.
g = 9.81;
t = (x-x0)/v0(1);
vx = v0(1);
vy = v0(2) - g.*t;
v = [vx;vy];
