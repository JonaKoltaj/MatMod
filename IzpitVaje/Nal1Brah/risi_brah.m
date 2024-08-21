function risi_brah(T1,T2,st_tock)
[x,y,theta] = brahistohrona(T1,T2);
fi = linspace(0,theta,st_tock);
figure
hold on
plot(x(fi)+T1(1),y(fi)+T1(2))
plot(T1(1),T1(2),'o')
plot(T2(1),T2(2),'o')