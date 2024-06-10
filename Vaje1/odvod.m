function d = odvod(p)
    n = length(p);
    d = zeros(1, n-1);
    for i = 1:(n-1)
        d(i) = (n-i)*p(i);
    end
%za velik bl efektivno verzijo si poglej resitve