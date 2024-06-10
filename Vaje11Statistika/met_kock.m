function A = met_kock(st_kock,n)
A = randi(6,n);
for i=1:(st_kock -1)
    A = A + randi(6,n);
end
histogram(A)