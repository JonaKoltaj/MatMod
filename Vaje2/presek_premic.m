function Tp = presek_premic(p1,p2)
% p1 in p2 sta zapisana implicitno z vektorjema [a1,b1,c1], [a2, b2, c2]
% Predpostavljamo, da presecisce obstaja.
syms x y
eqns = [p1(1)*x + p1(2)*y + p1(3), p2(1)*x + p2(2)*y + p2(3)];
S = solve(eqns, [x y]);
Tp = [S.x, S.y];