function risi_brah(T1,T2,st_tock)
% najprej transliramo t1 v (0,0) in t2 primerno
B = T2(2) - T1(2);
b = T2(1)- T1(1);
% st_tock je stevilo razdelitev intervala [T1(1),T2(1)]
% pri meni bo fi nedolocena spremenljivka, theta pa koncni fi (da se izognem *)
[k,theta] = isci_theta_k(b,B);
x = @(fi) (k^2)*(fi - sin(fi))/2;
y = @(fi) - (k^2)*(1 - cos(fi))/2;
fi = linspace(0,theta,st_tock);
figure
hold on
plot(x(fi)+T1(1),y(fi)+T1(2))
plot(T1(1),T1(2),'o')
plot(T2(1),T2(2),'o')