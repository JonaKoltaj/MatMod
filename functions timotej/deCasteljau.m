function Y = deCasteljau(b,t)
% DECASTLEJAU algoritm for single time input
    m = size(b, 2); %stevilo vrstic
    n = size(t, 2); %stevilo stolpcov
    Y = repmat(b', 1,n);
    for i=1:m-1
        Y(1:end-1,:) = Y(1:end-1,:).*(1-t) + Y(2:end, :).*t; 
    end
    Y = Y(1,:);
end
% tehnicno taprvi koeficienti so samo polinom evaluiran v tocki
% ker parametrizacija je ubistvu polinomska
% tkoda se mgoce blj splaca (zadar metode polyder) dejansko jih kot
% polinome podat

