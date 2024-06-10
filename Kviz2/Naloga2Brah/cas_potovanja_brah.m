function t = cas_potovanja_brah(T1,T2)
g = 9.81;
B = T2(2) - T1(2);
b = T2(1)- T1(1);
[~,theta] = isci_theta_k(b,B);
t = sqrt(2*b/(2*g*(theta - sin(theta))))*theta;