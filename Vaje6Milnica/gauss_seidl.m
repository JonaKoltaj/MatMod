function U = gauss_seidl(U,tol,a)
n = length(U) - 2;
x = linspace(-a,a,n+2);
y = linspace(-a,a,n+2);
[X,Y]=meshgrid(x,y);
figure
axis equal
s = 10;
while s>tol
    A = U;
    for i = 1:n
        for j = 1:n
            U(i+1,j+1) = (U(i+1,j)+U(i+2,j+1)+U(i+1,j+2)+U(i,j+1))/4;
        end
        Z = U;
        surf(X,Y,Z)
        axis equal
        drawnow
    end
    s = max(max(abs(A-U)));
end