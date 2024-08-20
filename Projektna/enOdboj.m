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

trenutni_x = x0;
for i = 1:length(X)
    if i<=length(X)-1
        while trenutni_x < X(1,i+1) %smo na odseku xiyi do xi+1yi+1
            if v0(1) ~= 0
                %njena nicla bo obstajala, uprasanje samo ce je within the
                %bounds levga in desnega
                fun = @(x) p(x,X(:,i),X(:,i+1)) - posevniMet(v0,x0,y0,x);
                x_presek = fzero(fun,x0);
                if (X(1,i) <= x_presek) && (x_presek <= X(1,i+1))
                    v = posevniMetv(v0,x_presek,x0)
                    x = x_presek
                    y = p(x_presek,X(:,i),X(:,i+1))
                else
                trenutni_x = X(1,i+1);
            else
                %preverimo ali je p(x0) med levim in desnim (itak je sam
                %navpicna premica at this point)
            end
        end
    else
        %nismo nasl nicle in se torej ne odbije se enkrat (karkol naj to
        %vrne)
    end
end

