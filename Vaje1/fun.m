function A = fun (m, n)
   [i,j] = ndgrid(1:m,1:n);
   A = ((j-4).^2).*((i+1).^(-3))+i.*j;