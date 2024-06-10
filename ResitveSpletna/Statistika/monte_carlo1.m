function I = monte_carlo1(f,a,b,N)
% MONTE_CARLO1 aproksimira integral
%
%     b              
%     /    
% I = | f(x) dx
%     /       
%     a     
%
% s pomocjo Monte Carlo metode
%
% I = (b-a)/N sum_i^N f(x_i).

% 1. moznost: uporaba zanke
I = 0;

for i = 1:N
    
    x = a + (b-a)*rand();
    I = I + f(x);
    
end

I = (b-a)/N*I;

% 2. moznost: brez zanke --> potrebujemo vec spomina
% zgeneriramo nakljucna stevila
% x = a + (b-a)*rand(N,1);
% I = (b-a)/N*sum(f(x));

end

