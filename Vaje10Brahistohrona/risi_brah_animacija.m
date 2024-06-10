function risi_brah_animacija(T1,T2,st_tock)
B = T2(2) - T1(2);
b = T2(1)- T1(1);
[k,theta] = isci_theta_k(b,B);
x = @(fi) (k^2)*(fi - sin(fi))/2;
y = @(fi) - (k^2)*(1 - cos(fi))/2;
fi = linspace(0,theta,st_tock);

figure
hold on
plot(T1(1),T1(2),'o')
plot(T2(1),T2(2),'o')
for i = 1:st_tock
    fii = linspace(0,fi(i),i);
    plot(x(fii)+T1(1),y(fii)+T1(2))
    drawnow
end