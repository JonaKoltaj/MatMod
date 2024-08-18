L = [1 2 1 2 2 1 2 1];
M = [1 1 1 1 1 1 1 1];
Xstart = [0;0];
Xend = [10;0];
u0 = - 0.3;

% X = diskrVeriznica(u0,Xstart,Xend,L,M);
% risiDiskretno(X)

xlevi = [0;0];
xdesni = [1;3];
sx = (xlevi(1)+xdesni(1))/2;
sy = (xlevi(2)+xdesni(2))/2;
li = norm(xdesni);
v0 = [0.3;-1];
v = odbojniKot(v0,li,xlevi,xdesni)
figure
hold on
plot([xlevi(1),xdesni(1)],[xlevi(2),xdesni(2)])
%ah whatever
plot([sx,-v0(1)+sx],[-v0(2)+sy,sy])
plot([sx,v(1)+sx],[sy,v(2)+sy])