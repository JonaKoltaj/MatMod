function razdalja = pomoznaFunRazdalja(w0,A,B,L,k)
X = diskrVeriznica(w0,A,B,k*L,k*L);
a = (k*L./2);
tez = [a;a].*(X(:,2:end)+X(:,1:(end-1)));
razdalja = norm((sum(tez,2)/sum(k*L))-[2 0]',2);