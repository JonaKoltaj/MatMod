function y = premicaDveTocki(A,B,x)
k = (B(2)-A(2))./(B(1)-A(1));
y = k.*(x-A(1))+A(2);