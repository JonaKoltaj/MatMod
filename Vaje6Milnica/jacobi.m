function U = jacobi(U,tol,a)
n = length(U) - 2;
x = linspace(-a,a,n+2);
y = linspace(-a,a,n+2);
[X,Y]=meshgrid(x,y);
s = 10;
while s>tol
    A = U;
    for i = 1:n
        for j = 1:n
            U(i+1,j+1) = (A(i+1,j)+A(i+2,j+1)+A(i+1,j+2)+A(i,j+1))/4;
        end
        Z = U;
        surf(X,Y,Z)
        axis equal
        drawnow
    end
    s = max(max(abs(A-U)));
end