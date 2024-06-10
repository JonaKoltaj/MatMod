function I = racunanje_pi(N)
% Nakljucno izbiramo pare stevil (x, y) v kvadratu
% [0,1] × [0,1]. Oznacimo z N stevilo vseh izbir, 
% s K pa stevilo tistih izbir, za katere je x2 + y2 ≤ 1.
% RACUNANJE_PI aproksimira pi kot
%
% pi = 4*K/N;
 
K = 0;

for i = 1:N
    
   x = rand();
   y = rand();
    
   if x^2+y^2 <= 1
       
       K = K + 1;
       
   end
    
end


I = 4*K/N;


end

