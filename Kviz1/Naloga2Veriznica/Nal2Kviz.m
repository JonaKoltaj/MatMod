LO = [0;3.05];
lo = [0;0];
ML = 10;
DO = [3.53;4.54];
do = [3.53;0];
MD = 8;
L = [1 1 1 1 1];
M = [1.50,1,1,1,1.50];
w0 = [-2;-3];

%2.1
X = diskrVeriznica(w0,LO,DO,L,M);
n = 5;
% figure
% hold on
% for i=1:(n+1)
%     plot(X(1,i),X(2,i),'o')
% end
% plot(X(1,:),X(2,:))
min = X(2,3);

%2.2
L1 = L.*0.9;
X1 = diskrVeriznica(w0,LO,DO,L1,M);
razlike = zeros(1,n);
for i=1:n
    razlike(i) = norm(X(:,i)-X1(:,i));
end
maxRazlika = max(razlike);

%2.3
Mvse = [ML, M, MD];
Lvse = [LO(2), L, DO(2)];
a = M./2;
Ltez = ML.*[0;LO(2)/2];
Dtez = MD.*[3.53;DO(2)/2];
tez = [a;a].*(X(:,2:end)+X(:,1:(end-1)));
tezVse = [Ltez, tez, Dtez];
T = sum(tezVse,2)/sum(Mvse);

%2.4
fun = @(k) pomozna(k,w0,LO,DO,M);
k0 = fzero(fun,2);

%2.5




