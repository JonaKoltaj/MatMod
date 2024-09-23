function risiDiskretno(X)
% Pomožna funkcija, ki izriše diskretno verižnico.
figure
hold on
n = length(X) - 2;
for i=1:(n+2)
    plot(X(1,i),X(2,i),'black o')
end
plot(X(1,:),X(2,:),'black')
axis equal