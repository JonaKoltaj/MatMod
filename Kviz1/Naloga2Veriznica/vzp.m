function razlika = vzp(w0, A, B, lastL)
  L = [1, 1, 2, 1, 1.5, lastL];
  X = diskrVeriznica(w0, A, B, L, L);
  razlika = X(2, 4) - X(2, 5);
end