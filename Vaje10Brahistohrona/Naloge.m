T1 = [1; 5];
T2 = [7; 3];
risi_brah(T1,T2,100)

% NAL 1
B = T2(2)- T1(2);
b = T2(1)- T1(1);
[k,theta] = isci_theta_k(b,B);
g = 9.81;
t_brah = k*theta/sqrt(2*g);
koef = B/b;
t_premica = 2*sqrt((1+koef^2)*b/(-2*g*koef));

% NAL 2
dy = @(fi) -sin(fi)*(k^2)/2;
x = @(fi) (k^2)*(fi - sin(fi))/2;
y = @(fi) - (k^2)*(1 - cos(fi))/2;
fi0 = fzero(dy,pi);
min = [x(fi0)+T1(1);y(fi0)+T1(2)];
plot(min(1),min(2),'o')