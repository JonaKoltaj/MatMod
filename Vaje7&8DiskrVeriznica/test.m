L = [1 2 1 1.5 1];
M = [2 4 2 1 1];
obesisceL = [1;5];
obesisceD = [4;4];
w0 = [-1; -6];

X = diskrVeriznica(w0,obesisceL,obesisceD,L,M);

n = length(L);
figure
hold on
for i=1:(n+1)
    plot(X(1,i),X(2,i),'o')
end
plot(X(1,:),X(2,:))