function [Y1,Y2] = subdiv_points(b,c)
    % subdivision at point 0 <= c <= 1
    % nekej podobnga kok decast algoritm ampk da ne pozablamo vmesnih tock?
    % lets check
    m = size(b, 2); %stevilo tock
    Y = zeros(m,m);
    Y(:,1) = b';
    for i = 2:m
        Y(1:end-1,i) = Y(1:end-1,i-1) * (1-c) + Y(2:end,i-1) * c;
    end
    Y1 = Y(1,:);
    Y2 = Y(m:m-1:end-1); % antidiagonala
end

