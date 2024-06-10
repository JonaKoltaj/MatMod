function [n, pari] = suma(a,s)
% function [n, pari] = suma(a,s)
% 
% Dan je urejen seznam a nepadajočih naravnih števil. 
% SUMA poišče vse pare števil, katerih vsota je dano število s.

% zacetni indeks
k = 1;

% končni indeks
m = length(a);

% število parov
n = 0;

% rezervacija spomina
pari = zeros(2,m); % zeros(2,m*(m-1)/2) je velikokrat preveč pesimistična in nam lahko zmanjka spomina

while k < m
   
    if a(k) + a(m) == s
        
        % poiščimo stevilo ponovitev a(m) == a(m-1) == a(m-2) ...
        repeat = 1;
        for i = m-1:-1:k+1
           if a(i) == a(m)
               repeat = repeat + 1;
           else
               break
           end
        end
            
        % if samo zaradi hitrosti, sicer nepotrebno ločevati
        if repeat==1
            pari(:,n+1) = [a(k);a(m)]; 
        else
            pari(:,n+1:n+repeat) = repmat([a(k);a(m)],1,repeat);
        end
        n = n + repeat;
        k = k + 1;
            
    elseif a(k) + a(m) < s
        k = k + 1;
    else % a(k) + a(m) > s
        m = m - 1;
    end
    
end

pari = pari(:,1:n);

end

