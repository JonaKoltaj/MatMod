function [u,du,ddu] = milnica1d(R,n,f)
    h = R/n;
    ri = h .* (0:n-1); % velikosti n
    % za tazadno mamo itak definiran u(R) = 0;

    % sestavmo matriko
    % glavna diagonala
    d0 = -2 .* ones(1,n);
    
    % ce mamo uno narascajoco je spodna diagonala 1 - d zgorna pa 1 + d
    % no ja ne cist
    d1 = 1 + 1/2 .* [2, 1./(1:n-2)];
    d1minus = 1 - 1/2 .* 1./(1:n-1);
    % sta relativno podobne
    % anyway lets see
    M = diag(d0) + diag(d1,1) + diag(d1minus, -1);
    % stimmt doch ne
    % jetzt ausprobieren C:
    fi = h^2 .* f(ri);
    u = M\fi';
    u = [u; 0];
    du = (u(2:end) - u(1:end-1))/ (2*h);
    ddu = 2 * (du(2:end) - du(1:end-1)) / h;
end

