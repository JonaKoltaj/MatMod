function P = mojrand(p,q,a,c,m,x0)
% MOJRAND vrne matriko nakljucnih stevil med 0 in 1
% na podlagi multiplikativnega kongruencnega generatorja
% 
% P je matrika nakljucnih stevil dimenzije p x q
% a,c in m so parametri generatorja
% x0 je zacetno stanje

%tvorimo zaporedje stevil x_{k+1} = a * x_k + c mod m, k=0,1,...
dim = p*q;
P = zeros(dim,1);

P(1)= mod(a*x0+c,m);

for i=2:dim
    P(i)= mod(a*P(i-1)+c,m);
end

P = P/m; % stevila normiramo na [0,1)

P = reshape(P,p,q);

end