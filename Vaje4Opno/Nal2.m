%NAL2
R = 2;
n = 10; % v bistvu dobimo n+1 dolga vektorja u in r

%a
F1 = @(r) 1;
[r1,u1] = opno(F1,R,n);
U1 = [flip(u1),u1(2:end)];
R1 = [flip(-r1),r1(2:end)];
figure
hold on
plot(R1,U1,'r')

%b
F2 = @(r) 1 - r^2;
[r2,u2] = opno(F2,R,n);
U2 = [flip(u2),u2(2:end)];
R2 = [flip(-r2),r2(2:end)];
plot(R2,U2,'b')

%c
F3 = @(r) sin(2*pi*r);
[r3,u3] = opno(F3,R,n);
U3 = [flip(u3),u3(2:end)];
R3 = [flip(-r3),r3(2:end)];
plot(R3,U3,'y')
hold off
axis equal