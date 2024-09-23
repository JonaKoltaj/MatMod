function [x,y,iFlag] = nOdbojev(X,n,v0)
% Funkcija sprejme verižnico, število odbojev, ki ga želimo ter začetno
% hitrost v0 (v obliki vektorja). Vrne koordinati x in y, kjer je žogica
% pristala, ter oznako, ki je 0, če je žogica po n odbojih še vedno na
% verižnici, ali pa je enaka indeksu, pri katerem je žogica odletela izven
% verižnice.

% Začnemo na polovici prvega členka
x0 = (X(1,1)+X(1,2))/2;
y0 = (X(2,1)+X(2,2))/2;
iFlag = 0;
% Prvi dve mesti matrike A sta hitrost, tretje je x0, četrto y0,
% zadnje pa je naša oznaka.
A = zeros([5,n+1]);
A(:,1) = [v0;x0;y0;0];
for i = 2:(n+1)
    [vi,xi,yi,flag] = enOdboj(X,A([1,2],i-1),A(3,i-1),A(4,i-1));
    A(:,i) = [vi;xi;yi;flag];
    % Pri i-tem odboju smo odleteli izven verižnice.
    if A(5,i) == 1
        iFlag = i-1;
        break
    end
end
x = A(3,end);
y = A(4,end);
        