function v = odbojnaHitrostMatrika(v0,Xlevi,Xdesni)
% Funkcija, ki pri danem vpadnem vektorju hitrosti ter levim in desnim
% krajiščem členka verižnice izračuna odbojni vektor hitrosti.

% Definiramo krajevni vektor u ter prehodno matriko A.
u = Xdesni - Xlevi;
A = [u(1),u(2); u(2),-u(1)];
% Vpadno hitrost preslikamo čez dani krajevni vektor u in dobimo odbojno
% hitrost.
v = A * [1 0; 0 -1] * inv(A) * v0;
