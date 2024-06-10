bx = [0 1 2 4];
by = [0, -1, -1, 2];
b = [bx;by];

s = [1;2];
phi = pi/4;

% premakni_bezier(b,s)
% rotiraj_bezier(b,phi)
% zrcali_bezier(b)
bsubx = sub_demo(bx,0.5);
bsuby = sub_demo(by,0.5);
plotBezier(b,'black','r')
plotBezier([bsubx;bsuby],'green','r')