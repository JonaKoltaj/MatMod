function z = F_uv(w,obesisceL,obesisceD,L,vsote_mi)
% F_uv vrne vrednost namenske vektorske funkcije za diskretno veriznico
% z = F(w) = [U(u,v);V(u,v)], w=[u;v]
% u = -1/2*lambdai*zetai, v = eta1/zeta1
% obesisceL = levo obesisce [x_0;y_0],
% obesisceD = desno obesisce [x_n+1;y_n+1],
% L = dolzine palic (vektor),
% vsote_mi = [0,mi_1,mi_1+mi_2,...] je vektor delnih vsot mi-jev.
u = w(1);
v = w(2);
%ocitno mi tuki negativno pride pod korenom
ksi = L./sqrt(1+(v-u.*vsote_mi).^2);
eta = ksi.*(v-u.*vsote_mi);
U = sum(ksi) - obesisceD(1) + obesisceL(1);
V = sum(eta) - obesisceD(2) + obesisceL(2);
z = [U;V];