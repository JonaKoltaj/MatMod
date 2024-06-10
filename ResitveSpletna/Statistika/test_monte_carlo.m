% test Monte Carlo metod
format long

% 1D

f = @(x) 1./(1+x);
a = 0;
b = 2;

N1 = 1e+6;

I1 = monte_carlo1(f,a,b,N1)

I1_tocna = log((b+1)/(a+1))

% 3D
g = @(x) x(1).*x(2).*x(3).^2;
h = @(x,y,z) x.*y.*z.^2;

% x smer
a1 = 0;
b1 = 1;

% y smer
a2 = 3;
b2 = 5;

% z smer
a3 = -1;
b3 = 1;

N3 = 1e+6;

I3 = monte_carlo3(h,a1,b1,a2,b2,a3,b3,N3)
I3_tocna = 1/12*(b3^3-a3^3)*(b2^2-a2^2)*(b1^2-a1^2)