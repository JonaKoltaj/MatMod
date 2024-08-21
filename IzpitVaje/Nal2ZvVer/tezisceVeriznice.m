function T = tezisceVeriznice(A,B,l)
% Funkcija računa težišce zvezne verižnice, s krajišči A, B in dolžino l.
[~,w] = zvVeriznica(A,B,l,10^(-16));
syms x
expr = matlabFunction(sqrt(1+diff(w(x)).^2));

rx = integral(@(x) x.*expr(x),A(1),B(1));
ry = integral(@(x) x.*expr(x),A(2),B(2));

T = [rx/l,ry/l];