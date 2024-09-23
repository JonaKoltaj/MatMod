function z = F_u(u,obesisceL,obesisceD,L,M)
% F_u vrne vrednost namenske vektorske funkcije za diskretno verižnico,
% kjer u = -1/2*lambda_i*ksi_i, obesisceL je levo obesišče, oblike
% [x_0;y_0], obesisceD je desno obesišče, oblike [x_n+1;y_n+1], L je vektor
% dolžin palic, M pa vektor mas palic.
n = length(L) - 1;
l = (n+1)/2;
% vsote_mi = [0,mi_1,mi_1+mi_2,...] je vektor delnih vsot mi-jev.
mi = zeros(1,n);
for i=1:n
    mi(i) = (M(i)+M(i+1))/2;
end
vsote_mi = [0,cumsum(mi)];
v = u.*(vsote_mi(l) + mi(l)/2);
ksi = L./sqrt(1+(v-u.*vsote_mi).^2);
z = sum(ksi) - obesisceD(1) + obesisceL(1);