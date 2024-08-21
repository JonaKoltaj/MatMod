function vrednosti = deCasteljau(b,t)
% Vrednost Bezierjeve krivulje v t s de Casteljauovim algoritmom
% b = kontrolni koefi Bezierjeve krivulje = [P0 P1 ... Pn]
% to je samo ce ustavis b dim2, ce zelis dim1 al pa dim>2 drugac uzames
% tiste iteracije
n = length(b);
vrednosti = repmat(b.',1,length(t));
for i=1:(n-1)
    vrednosti = vrednosti(1:(end-1),:).*(1-t) + vrednosti(2:end,:).*t;
end