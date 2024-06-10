function [S,r] = vcrtana_kroznica(T)
% T je 3x2 matrika, kjer prvi stolpec predstavlja x koordinate, drugi pa y koordinate.
%  S=[x;y], r je stevilo
sim1 = simetrala_kota(T(1,:),T(2,:),T(3,:));
sim2 = simetrala_kota(T(2,:),T(3,:),T(1,:));
S = presek_premic(sim1,sim2);
a = norm(T(1,:)-T(2,:));
b = norm(T(2,:)-T(3,:));
c = norm(T(3,:)-T(1,:));
s = (a+b+c)/2;
pl = sqrt(s*(s-a)*(s-b)*(s-c));
r = pl/s;