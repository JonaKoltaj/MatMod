function b = aproksimacija_kroznice(fi,d)
P0 = [cos(-fi);sin(-fi)];
P1 = @(L) P0 + L.*[sin(-fi);cos(-fi)];