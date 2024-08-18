function z = F_u(u,obesisceL,obesisceD,L,M)
% F_uv vrne vrednost namenske vektorske funkcije za diskretno veriznico
% z = F(u)
% u = -1/2*lambda_i*ksi_i
% obesisceL = levo obesisce [x_0;y_0],
% obesisceD = desno obesisce [x_n+1;y_n+1],
% L = dolzine palic (vektor), M = mase palic (vektor).
% vsote_mi = [0,mi_1,mi_1+mi_2,...] je vektor delnih vsot mi-jev.
n = length(L) - 1;
mi = zeros(1,n);
for i=1:n
    mi(i) = (M(i)+M(i+1))/2;
end
vsote_mi = [0,cumsum(mi)];
l = (n+1)/2;
v = u.*(vsote_mi(l) + mi(l)/2);
ksi = L./sqrt(1+(v-u.*vsote_mi).^2);
z = sum(ksi) - obesisceD(1) + obesisceL(1);