L = [1 2 2 1];
M = [1 1 1 1];
Xstart = [0;0];
Xend = [5;0];
u0 = - 0.3;

X = diskrVeriznica(u0,Xstart,Xend,L,M);
risiDiskretno(X)

levi = X(:,1);
desni = X(:,2);
v0 = [0;-1];
x0 = (X(1,1)+X(1,2))/2;
y0 = (X(2,1)+X(2,2))/2;


%zdej ti ful grdo izrisuje te puscice, dej to spremen pa also dej nared
%funkcijo za n odbojev (kinda easy), pol pa nared da ti outputta tisti n pr
%katermu se ustav, ce umes ze odleti out of bounds
% risiOdbojnoHitrost(v0,levi,desni,x0,y0)
[v1,x1,y1] = enOdboj(X,v0,x0,y0);
[v2,x2,y2] = enOdboj(X,v1,x1,y1);
[v3,x3,y3] = enOdboj(X,v2,x2,y2);
[v4,x4,y4] = enOdboj(X,v3,x3,y3);
[v5,x5,y5] = enOdboj(X,v4,x4,y4);
[v6,x6,y6] = enOdboj(X,v5,x5,y5); %hmm kle je nek problem kam gre hitrost

