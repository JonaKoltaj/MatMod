function z = zvVeriznica_iteracijskaFun(T1,T2,l,z0,tol)
% T1=[a;A] levo obesisce, T2=[b;B] desno obesisce
% l dolzina veriznice
% z0 zacetni priblizek, tol toleranca pri ustavitvi iteracije
% z numericna resitev enacbe z=asinh(ro*z)
ro = (l/(T2(1)-T1(1)))*sqrt(1-((T2(2)-T1(2))/l)^2);
% navadna iteracija:
error = 100;
zk = z0;
while error > tol
    zk1 = asinh(ro*zk);
    error = abs(zk1-zk);
    zk = zk1;
end
z = zk;