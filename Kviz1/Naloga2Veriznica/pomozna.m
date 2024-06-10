function y3 = pomozna(k,w0,LO,DO,M)
Lk = [k k k k k];
Xk = diskrVeriznica(w0,LO,DO,Lk,M);
y3 = Xk(2,3);