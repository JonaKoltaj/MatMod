function [z, X,T] = zveznaVeriznica(A, B, L, z0, tol)
    if nargin <5, tol = eps; end
    if nargin <4, z0 = 1; end
    %rho funkcija
    rho = @(A, B, L) L ./ (B(1)-A(1)) .* sqrt( 1 - ((B(2) - A(2))./L).^2);
    rho1 = rho(A,B,L);

    %jacobi iteracija
    z = jacobi_iteracija_sinh(rho1, z0, tol);

    %unpack values
    v = atanh((B(2)-A(2))/L) + z;
    u = atanh((B(2)-A(2))/L) - z;
    
    C = (B(1)-A(1))/(v-u);
    D = (A(1) * v - B(1) * u)/(v-u);

    %determine base omega
    
    w = @(x) C .* cosh((x-D)./C);
    
    %determine lambda
    lambda = A(2) - w(A(1));

    %plot and min
    x = linspace(A(1),B(1),1000);
    y = w(x) + lambda;
    X = [x;y];
    [C,I] = min(y);
    T = [x(I); C]; % minargument
end

%jacobi iteracijska funkcija za sinh
function z = jacobi_iteracija_sinh(rho,z0, tol)
    if nargin <2, tol = eps; end
    z1 = z0;
    z2 = asinh(rho * z0);
    while abs(z1 - z2) > tol
        z1 = z2;
        z2 = asinh(rho * z2);
    end
    z = z2;
end

