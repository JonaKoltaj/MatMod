function I = monte_carlo3(f,a1,b1,a2,b2,a3,b3,N)
% MONTE_CARLO3 aproksimira integral
%
%     b1    b2    b3            
%     /     /     /           
% I = |dx   |dy   |  f(x,y,z) dz
%     /     /     /            
%     a1    a2    a3
%
% s pomocjo Monte Carlo metode
%
% I = (b1-a1)*(b2-a2)*(b3-a3)/N sum_i^N f(x_i,y_i,z_i)

I = 0;
for i = 1:N
    
    x = a1 + (b1-a1)*rand();
    y = a2 + (b2-a2)*rand();
    z = a3 + (b3-a3)*rand();
    I = I + f(x,y,z);
    
end
    
I = (b1-a1)*(b2-a2)*(b3-a3)/N * I;

end