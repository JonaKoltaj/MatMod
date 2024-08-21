function [v,x,y] = enOdboj(X,v0,x0,y0)
% Funkcija, ki sprejme diskretno veriznico X, začetni vektor hitrosti v0
% ter začetne koordinate x0 in y0
% Funkcija vrne vektor odbojne hitrosti in koordinati, kjer žogica pristane.

% Najprej poiščemo na kateri palici smo in podamo levo ter desno krajišče.
% Recimo, da nimamo izrojenega primera, kjer je kakšna palica navpična.
idx = find(X(1,:) <= x0, 1, 'last');
Xlevi = X(:,idx);
Xdesni = X(:,(idx+1));
vOdboj = odbojnaHitrost(v0,Xlevi,Xdesni);

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
            % Za vsak i smo na odseku [x_i;y_i] do [x_i;y_i].
            fun = @(x) p(x,X(:,i),X(:,i+1)) - posevniMet(vOdboj,x0,y0,x);
            % Njena nicla bo obstajala, vprasanje je samo če je within
            % the bounds levga in desnega.
            % Ker ima funkcija lahko dva potencialna preseka,
            % vzamemo dva možna začetna približka.
            x_presek1 = fzero(fun,X(1,i));
            x_presek2 = fzero(fun,X(1,i+1));
            if (X(1,i) <= x_presek1) && (x_presek1 <= X(1,i+1)) && (x_presek1 - x0 > 0.001)
                v = posevniMetv(vOdboj,x_presek1,x0);
                x = x_presek1;
                y = p(x_presek1,X(:,i),X(:,i+1));
                % risiOdbojnoHitrost(v,X(:,i),X(:,i+1),x,y)
            elseif (X(1,i) <= x_presek2) && (x_presek2 <= X(1,i+1)) && (x_presek2 - x0 > 0.001)
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
