rr = randhat(100000);
histogram(rr,linspace(-1,1,100));

function [y] = rhohat(x) %First we need the density

if (x < 0)
    y = x + 1;
else
    y = 1 - x;
end

end


function [x] = randhat(n) %Now the random number generator
x = zeros(1,n);
k = 0; % keep count of numbers generated
while (k < n)
    xx = -1 + 2*rand(1,1); % uniform on [-1,1]
    yy = rand(1,1);
    if (yy <= rhohat(xx)) % accept xx
        k = k + 1;
        x(k) = xx;
    end
end

end