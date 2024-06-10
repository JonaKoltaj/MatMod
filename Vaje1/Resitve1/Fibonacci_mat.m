function F = Fibonacci_mat(n)
% function F = Fibonacci_mat(n)
v = [1 1; 1 0]^n * [0; 1];
F = v(1);