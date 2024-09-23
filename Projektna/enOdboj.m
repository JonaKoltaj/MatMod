function [v,x,y] = enOdboj(X,v0,x0,y0)
% Funkcija, ki sprejme diskretno veriznico X, začetni vektor hitrosti v0
% ter začetne koordinate x0 in y0
% Funkcija vrne vektor odbojne hitrosti in koordinati, kjer žogica pristane.

% Najprej poiščemo na kateri palici smo in podamo levo ter desno krajišče.
% Recimo, da nimamo izrojenega primera, kjer je kakšna palica navpična.
idx = find(X(1,:) <= x0, 1, 'last');
Xlevi = X(:,idx);
Xdesni = X(:,(idx+1));
vOdboj = odbojnaHitrostMatrika(v0,Xlevi,Xdesni);

k = @(levi,desni) (desni(2)-levi(2))./(desni(1)-levi(1));
p = @(x,levi,desni) k(levi,desni).*(x-levi(1))+levi(2);

x = x0;
if vOdboj(1) == 0
    % Smo v navpičnem metu in žogica pride nazaj z isto hitrostjo v
    % obratni smeri. Primer kjer bi se žogica odbila navpično navzdol se
    % tako ali tako ne zgodi.
    v = [vOdboj(0); - vOdboj(1)];
    x = x0;
    y = y0;
    risiOdbojnoHitrost(v,Xlevi,Xdesni)
else
    for i = 1:length(X)
        if i<=length(X)-1

	    vx = vOdboj(1);
	    vy = vOdboj(2);
	    g = 9.81;
	    xi1 = X(1, i);
	    xi2 = X(2, i);
	    ki = k(X(:, i), X(:, i+1));

  	    D = sqrt(ki^2*vx^2 - 2*ki*vx*vy - 2*g*ki*x0 + 2*g*ki*xi1 + vy^2 - 2*g*xi2 + 2*g*y0)*vx;
  	    x_presek1 = -(ki*vx^2 - vx*vy - g*x0 + D)/g;
  	    x_presek2 = -(ki*vx^2 - vx*vy - g*x0 - D)/g;

	    %% V primeru da presečišče iščemo na palici, od katere smo se odbili, je ena od ničel gotovo
	    %% enaka x0. Obe ničli nastavimo na tisto, ki ni enaka x0.

	    if i == idx
	      if x_presek2 == x0
		x_presek2 = x_presek1;
	      else
		x_presek1 = x_presek2;
	      end
	    end

            if (X(1,i) <= x_presek1) && (x_presek1 <= X(1,i+1))
                v = posevniMetv(vOdboj,x_presek1,x0);
                x = x_presek1;
                y = p(x_presek1,X(:,i),X(:,i+1));
                % risiOdbojnoHitrost(v,X(:,i),X(:,i+1),x,y)
            elseif (X(1,i) <= x_presek2) && (x_presek2 <= X(1,i+1))
                v = posevniMetv(vOdboj,x_presek2,x0);
                x = x_presek2;
                y = p(x_presek2,X(:,i),X(:,i+1));
                % risiOdbojnoHitrost(v,X(:,i),X(:,i+1),x,y)
            end
        else
            % Torej ce nismo prisli do drugih x-ov, y-ov v nobenem od
            % prejsnjih instancev.
            if x == x0
                % Žogica se odbije predaleč in ne zadane več verižnice, zato se
                % ustavimo malo dlje kot pri zadnjem spoju.
                v = posevniMetv(vOdboj, X(1,end)+1, x0);
                x = X(1,end) + 1;
                y = posevniMet(vOdboj,x0,y0,X(1,end) + 1);
            end
        end
    end
end

xvekt = linspace(x0,x);
plot(x,y,'magenta x')
plot(xvekt,posevniMet(vOdboj,x0,y0,xvekt),'magenta')
