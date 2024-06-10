function premakni_bezier(b,s)
%b oblike [P0 P1 ... Pn], kjer Pi oblike [xi;yi]
%s je oblike [s1;s2]
%crn star poligon, modr nov, rdeca stara krivulja, zelena nova
plotBezier(b,'black','r')
premaknjen_b = b + s;
plotBezier(premaknjen_b,'b','green')