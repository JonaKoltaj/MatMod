function zrcali_bezier(b)
% premica p dolocena s prvo in zadnjo tocko b-ja
k = (b(2,end)-b(2,1)) / (b(1,end)-b(1,1));
n = b(2,1)-b(1,1)*k;
b_zrcaljeno = b;
for i=2:(length(b)-1)
    nb = b(2,i) + b(1,i)/k;
    xa = (nb-n)/(k+1/k);
    ya = k*xa + n;
    b_zrcaljeno(1,i) = 2*xa - b(1,i);
    b_zrcaljeno(2,i) = 2*ya - b(2,i);
end
plotBezier(b,'black','r')
plotBezier(b_zrcaljeno,'b','green')



