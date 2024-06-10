function [x,y,theta] = brahistohrona(T1,T2)
% najprej transliramo t1 v (0,0) in t2 primerno
B = T2(2) - T1(2);
b = T2(1)- T1(1);
% st_tock je stevilo razdelitev intervala [T1(1),T2(1)]
% pri meni bo fi nedolocena spremenljivka, theta pa koncni fi (da se izognem *)
[k,theta] = isci_theta_k(b,B);
x = @(fi) (k^2).*(fi - sin(fi))./2;
y = @(fi) - (k^2).*(1 - cos(fi))./2;