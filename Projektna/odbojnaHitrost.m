function v = odbojnaHitrost(v0,Xlevi,Xdesni)
% Funkcija iz vpadne hitrosti in naklona i-te palice izracuna vektor
% odbojne hitrosti (velikost je enaka, samo smer je drugacna)
% v0 = [v_x0 ; v_y0]
% Li je dolzina palice od katere se odbijamo
Li = sqrt((Xlevi(1)-Xdesni(1))^2 + (Xlevi(2)-Xdesni(2))^2);
%fi je kot med vodoravnico in palico
fi = asin((Xdesni(2) - Xlevi(2))./Li);
vnorm = norm(v0);
% psi je kot med navpicnico in vpadno hitrostji (pozitiven ce je hitrost iz
% leve)
psi = asin(v0(1)/vnorm);
%alfa je odbojni kot (med hitrostjo in vodoravnico)
alfa = 2.*fi + pi/2 - psi;
v = [vnorm*cos(alfa);vnorm*sin(alfa)];


