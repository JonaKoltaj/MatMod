format("long")

A = [0;20];
B = [10;15];
tol = 10^(-16);

%1.1
l = 15;
[T_min,w] = zvVeriznica(A,B,l,tol);
x_min = T_min(1);

%1.2
razdaljaAB = norm(A-B);
mozenPadec = l - razdaljaAB;

%1.3
fun = @(l) pomoznaFun1(l) - 14;
dolzina14 = fzero(fun,13);

%1.4
dolzina_do_klina = dolzinaKrivulje(0,x_min,w);
[~,w2] = zvVeriznica(A,B,14,tol);
fun2 = @(b) dolzinaKrivulje(0,b,w2) - dolzina_do_klina;
xKlina = fzero(fun2,7);
premik = xKlina - x_min;

