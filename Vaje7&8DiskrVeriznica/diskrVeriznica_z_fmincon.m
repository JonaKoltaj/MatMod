function X = diskrVeriznica_z_fmincon (obesisceL, obesisceD, L, M)
% M mase, L dolzine
% X = 2x(n+1) v zg vrstici xi, v sp vrstici yi
n = length(L) - 2
F = @(X) sum(M.*(X(1,1:end-1)' + X(1,2:end)')/2);
% X0 bo oblike [x0 0 ... 0 xn+1]
%              [y0 0 ... 0 yn+1]
X0 = [obesisceL zeros(2,n) obesisceD];
% to jih samo zlozi po vrsti, torej x0 y0 0 0 .. 0 0 xn+1 yn+1
X0 = X0(:);
X = fmincon(F,X0,[],[],[],[],[],[],@(X) nelinPogoji(X,L,obesisceL,obesisceD));

figure
plot(X(1,:),X(2,:),"-o")


