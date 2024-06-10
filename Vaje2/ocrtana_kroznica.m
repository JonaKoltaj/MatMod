function [S,r] = ocrtana_kroznica(T)
% T je 3x2 matrika, kjer prvi stolpec predstavlja x koordinate, drugi pa y koordinate.
%  S=[x;y], r je stevilo
sim1 = simetrala(T(1,:),T(2,:));
sim2 = simetrala(T(2,:),T(3,:));
S = presek_premic(sim1,sim2);
r = norm(T(1,:)-S);
