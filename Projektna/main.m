function main(u0,Xlevi,Xdesni,L,M,n,v0)
% Funkcija main sprejme podatke za simetrično diskretno verižnico z sodo
% členki, število n ter vektor v0 in izriše podano verižnico ter n odbojev
% kroglice, ki bi prosto padla na prvi členek te verižnice, s hitrostjo v0.
% V funkcijo main se najprej vnese podatke za diskretno verižnico, kjer je
% u0 začetni približek, Xlevi je levo obesišče, Xdesni desno obesišče,
% L vektor dolžin in M vektor mas. Nato se vnese še število odbojev, ki jih
% želimo opazovati ter vektor začetne hitrosti žogice.

X = diskrVeriznica(u0,Xlevi,Xdesni,L,M);
risiDiskretno(X)

[x,y,flag] = nOdbojev(X,n,v0);
if flag == 0
    idx = find(X(1,:) <= x, 1, 'last');
    plot(x,y,'red o')
    msg = sprintf('Kroglica je končala v točki [%0.3f,%0.3f], na %d. členku verižnice.', x, y, idx);
    msgbox(msg)
else
    msg = sprintf('Kroglica se je pri %d. odboju odbila predaleč in verižnico preskočila.',flag);
    msgbox(msg)
end

