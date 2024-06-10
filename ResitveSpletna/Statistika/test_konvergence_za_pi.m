% test konvergence racunanja pi preko zadeni/zgresi in preko monte_carlo1

N(1) = 10;
for i=1:15 % st drobljenj
    val1 = zeros(1,10);
    val2 = zeros(1,10);
    for j=1:1 % st ponovitev simulacije
        val1(j) = racunanje_pi(N(i))-pi;
        val2(j) = (monte_carlo1(@(x) sqrt(1 - x.^2),0,1,N(i))*4)-pi;
    end
    err1(i) = norm(val1); % norma napake za prvi pristop (z/z)
    err2(i) = norm(val2); % norma napake za drugi pristop (MC)
    N(i+1) = N(i)*2;
end
N = N(1:end-1);

figure
loglog(N,err1,'ro-', N,err2,'b*-')

conv1 = log(err1(2:end)./err1(1:end-1))/log(1/2);
mean(conv1)

conv1 = log(err2(2:end)./err2(1:end-1))/log(1/2);
mean(conv1)