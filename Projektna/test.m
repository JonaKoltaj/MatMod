function test()

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

[v1,x1,y1] = enOdboj(X,v0,x0,y0);
[v2,x2,y2] = enOdboj(X,v1,x1,y1);
[v3,x3,y3] = enOdboj(X,v2,x2,y2);
[v4,x4,y4] = enOdboj(X,v3,x3,y3);
[v5,x5,y5] = enOdboj(X,v4,x4,y4);
[v6,x6,y6] = enOdboj(X,v5,x5,y5);
[v7,x7,y7] = enOdboj(X,v6,x6,y6);

%%L = linspace(x5-1, x5+1);
%%vOdboj = odbojnaHitrostMatrika(v5, X(:, 3), X(:, 4))
%%plot(L,posevniMet(vOdboj,x5,y5,L),'magenta');

				% GARBAGE BELOW

%%% k = @(levi,desni) (desni(2)-levi(2))./(desni(1)-levi(1));
%%% vOdboj = odbojnaHitrostMatrika(v5,X(:, 3),X(:, 4));
%%% vx = vOdboj(1);
%%% vy = vOdboj(2);
%%% g = 9.81;
%%% xi1 = X(1, 3);
%%% xi2 = X(2, 3);
%%% ki = k(X(:, 3), X(:, 4));
%%%
%%% D = sqrt(ki^2*vx^2 - 2*ki*vx*vy - 2*g*ki*x5 + 2*g*ki*xi1 + vy^2 - 2*g*xi2 + 2*g*y5)*vx;
%%% x_presek1 = -(ki*vx^2 - vx*vy - g*x5 - D)/g;
%%% x_presek2 = -(ki*vx^2 - vx*vy - g*x5 + D)/g;
%%% plot(x_presek1, ki*(x_presek1 - xi1) + xi2, 'o');
%%% plot(x_presek2, ki*(x_presek2 - xi1) + xi2, 'o');
%%%
%%% L = linspace(x_presek1, x_presek2);
%%% plot(L, posevniMet(vOdboj, x5, y5, L));
%%%
%%% xi1 = X(1, 2);
%%% xi2 = X(2, 2);
%%% ki = k(X(:, 2), X(:, 3));
%%%
%%% D = sqrt(ki^2*vx^2 - 2*ki*vx*vy - 2*g*ki*x5 + 2*g*ki*xi1 + vy^2 - 2*g*xi2 + 2*g*y5)*vx;
%%% x_presek1 = -(ki*vx^2 - vx*vy - g*x5 - D)/g;
%%% x_presek2 = -(ki*vx^2 - vx*vy - g*x5 + D)/g;
%%% plot(x_presek1, ki*(x_presek1 - xi1) + xi2, 'o');
%%% plot(x_presek2, ki*(x_presek2 - xi1) + xi2, 'o');
%%%
%%% L = linspace(x_presek1, x_presek2);
%%% plot(L, posevniMet(vOdboj, x5, y5, L));
