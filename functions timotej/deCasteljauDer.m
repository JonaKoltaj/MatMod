function Y = deCasteljauDer(b,t)
    n = size(b,2)-1;
    b = n .* (b(:,2:end) - b(:,1:end-1));
    Y = deCasteljau(b,t);
end
