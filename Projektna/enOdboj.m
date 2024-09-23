function [v,x,y,flag] = enOdboj(X,v0,x0,y0)
% Funkcija, ki sprejme diskretno veriznico X, začetni vektor hitrosti v0
% ter začetni koordinati x0 in y0 ter vrne vektor odbojne hitrosti in, 
% koordinati, kjer žogica pristane ter oznako, ali je žogica odletela izven
% verižnice. Če je flag = 0, to pomeni, da je žogica uspešno pristala na
% verižnici, drugače se oznaka spremeni v 1.
flag = 0;

% Najprej poiščemo na kateri palici smo in podamo levo ter desno krajišče.
% Recimo, da nimamo izrojenega primera, kjer je kakšna palica navpična.
idx = find(X(1,:) <= x0, 1, 'last');
Xlevi = X(:,idx);
Xdesni = X(:,(idx+1));

vOdboj = odbojnaHitrostMatrika(v0,Xlevi,Xdesni);

if vOdboj(1) == 0
    % Smo v navpičnem metu in žogica pride nazaj z isto hitrostjo, v
    % obratni smeri. Primer kjer bi se žogica odbila navpično navzdol se
    % tako ali tako ne zgodi.
    v = [vOdboj(1); -vOdboj(2)];
    x = x0;
    y = y0;
    % V tem primeru posebej narišemo še kako visoko je šla žogica.
    hmax = (vOdboj(2)^2)/(2*9.81);
    plot([x0 x0],[y0 hmax])
else
    for i = 1:length(X)
        % Najprej pogledamo za vsak členek posebej, če se tam parabola
        % poševnega meta seka s členkom.
        if i <= length(X) - 1
	        vx = vOdboj(1);
	        vy = vOdboj(2);
	        g = 9.81;
	        xi = X(1,i);
	        yi = X(2,i);
            ki = (X(2,i+1)-X(2,i))./(X(1,i+1)-X(1,i));
    
  	        D = sqrt(ki^2*vx^2 - 2*ki*vx*vy - 2*g*ki*x0 + 2*g*ki*xi + vy^2 - 2*g*yi + 2*g*y0)*vx;
  	        x_presek1 = -(ki*vx^2 - vx*vy - g*x0 + D)/g;
  	        x_presek2 = -(ki*vx^2 - vx*vy - g*x0 - D)/g;
    
	        % V primeru da presečišče iščemo na palici, od katere smo se odbili, je ena od ničel gotovo
	        % enaka x0. Obe ničli nastavimo na tisto, ki ni enaka x0.
            if i == idx
	          if x_presek2 == x0
		        x_presek2 = x_presek1;
	          else
		        x_presek1 = x_presek2;
	          end
            end
            % Pogledamo, če sta ničli na odseku, ki ga gledamo. Če sta,
            % nastavimo x na ničlo ter y na pripadajočo y koordinato na
            % členku ter uidemo iz for-zanke.
            if (X(1,i) <= x_presek1) && (x_presek1 <= X(1,i+1))
                v = posevniMetv(vOdboj,x_presek1,x0);
                x = x_presek1;
                y = ki.*(x_presek1-X(1,i))+X(2,i);
                break
            elseif (X(1,i) <= x_presek2) && (x_presek2 <= X(1,i+1))
                v = posevniMetv(vOdboj,x_presek2,x0);
                x = x_presek2;
                y = ki.*(x_presek2-X(1,i))+X(2,i);
                break
            end
        else
            % Če se parabola nikjer ne seka s kateremkoli od členkov.
            flag = 1;
            % Žogica se odbije predaleč in ne zadane več verižnice, zato se
            % ustavimo kar malo dlje kot pri zadnjem ali pa prvem spoju,
            % glede na to v katero smer se odbijemo.
            if vOdboj(1) > 0
                v = posevniMetv(vOdboj, X(1,end) + 0.5, x0);
                x = X(1,end) + 0.5;
                y = posevniMet(vOdboj, x0, y0, X(1,end) + 0.5);
            else
                v = posevniMetv(vOdboj,X(1,1) - 0.5,x0);
                x = X(1,1) - 0.5;
                y = posevniMet(vOdboj, x0, y0, X(1,1) - 0.5);
            end
        end
    end
end

% Pri vsakem odboju nato dano parabolo odboja narišemo, vključno s točko,
% kjer je pristala.
xvekt = linspace(x0,x);
plot(x,y,'x')
plot(xvekt,posevniMet(vOdboj,x0,y0,xvekt))
