function Y = deCasteljau2d(B, t)
    m = size(B,2); %predpostavlamo da je xov pa yov enako
    n = size(t,2);
    t = reshape(t, 1 ,1, n);
    Y = repmat(B',1,1,n);
    for i = 1:m-1
        Y(1:end-1,:,:) = Y(1:end-1,:,:).*(1-t) + Y(2:end, :,:).*t;
        % Y(1:end-1,2,:) = Y(1:end-1,2,:).*(1-t) + Y(2:end, 2,:).*t;
    end
    Y = Y(1,1:2,:);
end