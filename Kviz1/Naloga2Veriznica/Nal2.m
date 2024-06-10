format("long")

A = [0.5;1];
B = [3.5;0.5];
L = [1 1 2 1 1.5 1];
w0 = [-2;-5];
g=9.81;

%2.1
X = diskrVeriznica(w0,A,B,L,L);
n = length(L);
% figure
% hold on
% for i=1:(n+1)
%     plot(X(1,i),X(2,i),'o')
% end
% plot(X(1,:),X(2,:))

% iz slike opazimo da je ta cetrti najnizje:) drugace pa minimum, ce zelimo
% splosno
vsotaMin = X(1,4) + X(2,4);

%2.2 
potencialna = sum((L./2).*(X(2,2:end)+X(2,1:(end-1))))*g;

%2.3
fun = @(lastL) vzp(w0, A, B, lastL);
dolzina = fzero(fun, 1);

%2.4
rotacija = @(kot) [cosd(kot) -sind(kot); sind(kot) cosd(kot)];
X2 = diskrVeriznica(rotacija(45)*w0, rotacija(45)*A, rotacija(45)*B, L, L);
X_mag = rotacija(-45)*X2;
% figure
% hold on
% for i=1:(n+1)
%     plot(X_mag(1,i),X_mag(2,i),'o')
% end
% plot(X_mag(1, :), X_mag(2, :), 'blue');
% plot(X(1, :), X(2, :), 'red');

% spet vidimo iz slike da je cetrti ta pravi
vsotaMinMag = X_mag(1,4) + X_mag(2,4);

%2.5
fun2 = @(k) sum(k*L) - 3;
dolzinaB = fzero(fun2,1);

k0 = fminbnd(@(k) pomoznaFunRazdalja(w0,A,B,L,k), dolzinaB, 1);
X3 = diskrVeriznica(w0,A,B,k0*L,k0*L);
a = (k0*L./2);
tez = [a;a].*(X(:,2:end)+X(:,1:(end-1)));
T = sum(tez,2)/sum(k0*L);
normaTezisca = norm(T, 2);







