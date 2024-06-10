n = 10;
a = 1;
tol = 0.001;

%a
f_levo = @(x) zeros(size(x));
f_desno = @(x) 1-x.^2;
f_zgoraj = @(x) 1-x.^2;
f_spodaj = @(x) x.^2-1;

% milnica(a,n,f_spodaj,f_zgoraj,f_levo,f_desno,tol,"GS")

%b
f = @(x) 1-x.^2;

milnica(a,n,f,f,f,f,tol,"GS")