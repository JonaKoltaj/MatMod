function r = resitev_diskretna_ver(parameter)
% Resitev za diskretno verižnico

format longg

% resitev
r = zeros(1,4);
g = 9.8;

% podatki
zac = [0 2;0 0]; % A in B krajni krajisci
L = [1 1 1 1];
M = [1+parameter/100 0.6 0.6 1+parameter/100];

% izracun veriznice
W0 = [-0.5;-1.2];
X = ver_uv(W0,zac,L,M);


% a) Koliksna je vsota razdalj krajisc vseh palic do tezisca diskretne verižnice?
tezisca_posameznih = (X(:,1:(end-1))+X(:,2:end))/2;
mase = [M;M];

% tezisce
tezisce = sum(mase.*tezisca_posameznih,2)/sum(M);

for i = 1:size(X,2)
    r(1) = r(1) + norm(X(:,i)-tezisce);
end

% b) Zapišite enačbo parabole, ki gre skozi obesišči diskretne verižnice in
% sta v teh točkah prva in zadnja palica tangencialni na parabolo. 
% Kolikšna je ordinata najnižje točke parabole?

naklon = (X(2,2)-X(2,1)) / (X(1,2)-X(1,1));

% sistem za koeficiente a,b,c parabole
A = [X(1,1)*X(1,1) X(1,1) 1; X(1,end)*X(1,end) X(1,end) 1; 2*X(1,1) 1 0];
rhs = [X(2,1); X(2,end); naklon];

koef = A\rhs;

% ordinata najnizje tocke na paraboli q = -D/4a
disk = koef(2)*koef(2) - 4*koef(1)*koef(3);
r(2) = -disk/(4*koef(1));


% c) Vsak členek veriznice razpolovimo (predpostavimo, da so clenki homogeni). 
% Koliksna je absolutna razlika potencialnih energij stare in nove veriznice?
W_old = potencialna(X,M,g);

% vsak clenek veriznice razpolovimo. 
% podatki
L_new = 0.5*ones(1,8);
M_new = 0.5*[1+parameter/100 1+parameter/100 0.6 0.6 0.6 0.6 1+parameter/100 1+parameter/100];

% izracun veriznice
W0 = [-0.5;-1.2];
X_new = ver_uv(W0,zac,L_new,M_new);

W_new = potencialna(X_new,M_new,g);

r(3) = abs(W_old - W_new);


% d) Dana je premica l z enačbo y =  0.5*( m1 + m2 ), kjer sta
% m1 in m2 najmanjša in največja vrednost ordinat krajisc.
% Oznacimo s P1 in P2 presecisci premice l z dano veriznico. 
% Koliksna je ploscina trapeza AP1P2B?
k = 0.5*( max(X(2,:)) + min(X(2,:)) );

% stranice trapeza
a = norm(zac(:,1)-zac(:,2));
visina = abs(k);

% b dobimo kot presescisce premice y = k s premico skozi tocki
    % X(:,1) in X(:,2) in nato izracunamo razdaljo med P1 in P2
if (k >= X(2,2))
    smerni = ( X(2,2)-X(2,1) ) / ( X(1,2)-X(1,1) );   
    x = X(1,1) + (k-X(2,1))/smerni;
    
else % k < X(2,2)
    smerni = ( X(2,2)-X(2,3) ) / ( X(1,2)-X(1,3) );
    x = X(1,2) + (k-X(2,2))/smerni;  
end

P1_x = X(1,1)+x;
P2_x = X(1,end)-x;
b = abs(P1_x - P2_x);

r(4) = (a+b)/2 * visina;




end




% POMOZNE FUNKCIJE

function W = potencialna(X,M,g)
% izracun potencialne
tezisca_y = (X(2,1:(end-1))+X(2,2:end))/2;
W = g*sum(M.*tezisca_y);

end

function Z = sistem_uv(W,zac,L,vsote_mi)
% SISTEM_UV nastavi sistem dveh nelinearnih enacb za
% diskretno veriznico. To sta enacbi (30) in (31) iz
% prilozenega clanka.
% 
% Vhodni parametri:
% W = [u;v], kjer sta u in v iskani neznanki.
% zac = [x_0 x_n+1;y_0 y_n+1], kjer sta (x_0,y_0) in
% (x_n+1, y_n+1) obesisci. 
% L je vrstica, ki doloca dolzine palic.
% vsote_mi je vrstica kumulativnih vsot, definiranih v (33).

u = W(1);
v = W(2);

xi = L./sqrt(1+(v-u*vsote_mi).^2);
eta = xi.*(v-u*vsote_mi);

Z=[sum(xi)-(zac(1,2)-zac(1,1));sum(eta)-(zac(2,2)-zac(2,1))];

end


function X = ver_uv(W0,zac,L,M)
% VER_UV resi problem veriznice iz sistema za u in v.
% Rezultat X je 2x(n+2) tabela koordinat vozlisc, kjer
% prva vrstica doloca abscise, druga ordinate iskanih tock.
%
% Vhodni parametri:
% W0 = [u0;v0] zaceten priblizek pri resevanju sistema
% nelinearnih enacb.
% zac = [x_0 x_n+1;y_0 y_n+1], kjer sta (x_0,y_0) in
% (x_n+1, y_n+1) obesisci. 
% L je vrstica, ki doloca dolzine palic.
% M je vrstica, ki doloca mase palic.

mi = (1/2)*(M(1:end-1)+M(2:end)); % formula (23)
vsote_mi = [0,cumsum(mi)]; % formula (33)

% izracun u in v
sistem = @(W) sistem_uv(W, zac, L, vsote_mi);

% 1. moznost: Ce imamo nalozen optimization toolbox,
% resimo sistem z vgrajeno funkcijo fsolve

options = optimoptions('fsolve','Display','none');

W = fsolve(sistem, W0, options);

u=W(1);
v=W(2);

% izracun xi in eta po formulah (27) in (25)
xi = L./sqrt(1+(v-u*vsote_mi).^2);
eta = xi.*(v-u*vsote_mi);

% izracun koordinat krajisc
X=[zac(1,1)+cumsum(xi);zac(2,1)+cumsum(eta)];
X=[zac(:,1) X];

end