function [neq, eq] = nelinPogoji(X,L,obesisceL,obesisceD)
% to so pac pogoji ki jih mamo poleg tega da zelimo min pot energijo
% basically ce resujemo brez lagrangeve metode
neq = [];
eq1 = (diff(X(1,end)).^2 + diff(X(2,:)).^2 - L'.^2); % pogoj dolzin
eq2 = [X(1:2) - obesisceL; X(end-1:end) - obesisceD]; % robni pogoj
eq = [eq1; eq2];