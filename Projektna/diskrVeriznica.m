function X = diskrVeriznica(u0,obesisceL,obesisceD,L,M)
% Funkcija s pomočjo fsolve najde u in v, kjer je v odvisen od u,
% tako da F(u) = 0. Sprejme u0, ki je začetni približek, obesiščeL, oblike
% [x_0;y_0], obesiščeD, oblike [x_n+1;y_n+1], vektor dolžin palic L in
% vektor mas palic M. Vrne nam 2x(n+2) matriko X, oblike [x_1 ... x_n+1; y_1 ... y_n+1].

% Ker je členkov diskretne verižnice sodo, je n liho število.
n = length(L) - 1;
l = (n+1)/2;

mi = zeros(1,n);
for i=1:n
    mi(i) = (M(i)+M(i+1))/2;
end
vsote_mi = [0,cumsum(mi)];

% Tu si pomagamo s funkcijo F(u), ki je definirana posebej.
v = @(u) u.*(vsote_mi(l) + mi(l)/2);
ksi = @(u) L./sqrt(1+(v(u)-u.*vsote_mi).^2);
eta = @(u) ksi(u).*(v(u)-u.*vsote_mi);
F = @(u) F_u(u,obesisceL,obesisceD,L,M);

u = fsolve(F,u0);
X = zeros(2,n+2);
X(:,1) = obesisceL;
vsote_ksi = cumsum(ksi(u));
vsote_eta = cumsum(eta(u));
for i=2:(n+2)
    X(1,i) = obesisceL(1) + vsote_ksi(i-1);
    X(2,i) = obesisceL(2) + vsote_eta(i-1);
end
