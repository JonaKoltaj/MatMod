function milnica(a,n,f_sp,f_zg,f_l,f_d,tol,metoda)
% fsp in fzg ofvisna od x, fl in fd pa odvisna od y
% [-a a] x [-a a] je def obmocje
% n + 2 st delilnih tock na eni koor osi
U = zeros(n+2,n+2);
x = linspace(-a,a,n+2); % povsod lahko dam samo x kr itak oboje tece od -a do a
U(1,:) = f_sp(x);
U(n+2,:) = f_zg(x);
U(:,1) = f_l(x);
U(:,n+2) = f_d(x);
if metoda == "J"
    jacobi(U,tol,a);
elseif metoda == "GS"
    gauss_seidl(U,tol,a);
else
    disp("Napacna metoda")
end