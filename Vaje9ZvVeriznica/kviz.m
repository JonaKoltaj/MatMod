T1 = [0;5];
T2 = [5;3];
l = 18;
tol = 10^(-16);
[T_min,w] = zvVeriznica(T1,T2,l,tol);

y2 = w(2)

xmin = T_min(1)

t = linspace(0,5);
plot(t,t)
f = @(x) w(x) - x;
p = fzero(f,0.5)
plot(p,p,'o')

% za cetrto tocko napisi kr po formuli za dolzino, dej syms x in odvod
% zracuni tko
% zracunas a pa b pr y=4 samo in das za meje integrala pa si