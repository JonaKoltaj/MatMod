function f = ro(y)
visine = [0 2000 4000 6000 8000 10000 15000 20000 25000 30000 40000];
gostote = [1.225 1.007 0.8194 0.6601 0.5258 0.4135 0.1948 0.08891 0.04008 0.01841 0.003996];
fun = @(x) [ones(size(x)); x.^2; x.^4];
fun2 = @(y) fun((y - 40000)/40000);
A = fun2(visine);
koef = (A.')\(gostote.');
f = polyval([koef(3), 0, koef(2), 0, koef(1)], (y - 40000)/40000); %funkcija zracnega upora