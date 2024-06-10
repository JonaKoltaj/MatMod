function pi = racunanje_pi(N)
X = rand(1,N);
Y = rand(1,N);
A = X.^2 + Y.^2 - 1;
K = length(find(A<=0));
pi = 4*K/N;