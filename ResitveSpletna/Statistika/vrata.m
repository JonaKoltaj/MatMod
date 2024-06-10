function vrata(n)
%VRATA simulacija igre s tremi vrati
%VRATA(n) n je stevilo ponovitev

zadetki = 0;

for i = 1:n
   %izberemo stevilko vrat z nagrado (tj. stevilo od 1 do 3):
   st_vrat = randi(3);
   
   %tabela vrat:
   v = zeros(1,3);
   
   %oznacimo kje je nagrada:
   v(st_vrat) = 1;
   
   %indeksi vrat, kjer ni nagrade:
   prazno = find(v==0);
   
   izbira1=input('Izberite vrata 1, 2 ali 3: ');
   
   if izbira1 == st_vrat
       odpri = randi(2); % nakljucno stevilo med 1 in 2
       fprintf('Nagrade ni za vratmi stevilka %d.\n', prazno(odpri));
   else 
       prazno = setdiff(prazno,izbira1);
       fprintf('Nagrade ni za vratmi stevilka %d.\n', prazno);
   end
   
   izbira2 = input('Lahko se enkrat izbirate: ');
   
   if izbira2 == st_vrat
       zadetki = zadetki+1;
       disp('BRAVO!!! Zadeli ste nagrado!');
   else
       disp('Zal nagrade ni za temi vrati!');
   end
   
   pause;     
   
end    
fprintf('Delez zadetkov je enak %2.2f procentov!\n', 100*zadetki/n);

end