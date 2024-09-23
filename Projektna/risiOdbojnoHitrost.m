function risiOdbojnoHitrost(v0,Xlevi,Xdesni,x0,y0)
vOdboj = odbojnaHitrostMatrika(v0,Xlevi,Xdesni);
v0norm = v0./(norm(v0)*3);
vOdbojnorm = vOdboj./(norm(vOdboj)*3);
hold on

plot([x0,-v0norm(1)+x0],[y0,-v0norm(2)+y0],'blue')
plot(x0,y0,'blue v')

plot([x0,-vOdbojnorm(1)+x0],[y0,-vOdbojnorm(2)+y0],'red')
plot(-vOdbojnorm(1)+x0, -vOdbojnorm(2)+y0,'red >')
axis equal
