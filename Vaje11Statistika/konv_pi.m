function konv_pi(N,n)
t = logspace(0,N);
err = logspace(0,N);
for i=1:length(t)
    %za vsako stevliko veckrat vzamemo povprecje
    err(i) = abs(pi - racunanje_pi(i));
    for j=1:(n-1)
        err(i) = err(i) + abs(pi - racunanje_pi(i));
    end
    err(i) = err(i)/n;
end
loglog(t,err)