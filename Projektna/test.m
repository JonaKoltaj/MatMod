L = [1 2 1 2 2 1 2 1];
M = [1 1 1 1 1 1 1 1];
Xstart = [0;0];
Xend = [10;0];
u0 = - 0.3;

% X = diskrVeriznica(u0,Xstart,Xend,L,M);
% risiDiskretno(X)


%funkcija odbojni kot deluje ce smo na desnih kvadrantih, zato kr sm
%implicitno settala levga na [0;0] in gremo itak vedno od leve proti desni
% desni = [1;-2];
% sx = desni(1)/2;
% sy = desni(2)/2;
% li = norm(desni);
% v0 = [0;-1];
% v = odbojniKot(v0,li,[0;0],desni)
% figure
% hold on
% plot([0,desni(1)],[0,desni(2)],'b')
% plot([sx,-v0(1)+sx],[sy,-v0(2)+sy],'r')
% plot([sx,v(1)+sx],[sy,v(2)+sy],'g')
% axis equal