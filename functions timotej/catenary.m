function [w, dw, T1] = catenary(A,B,L)
    [z,~,~] = zveznaVeriznica(A,B,L);
    
    v = atanh((B(2)-A(2))/L) + z;
    u = atanh((B(2)-A(2))/L) - z;
    
    C = (B(1)-A(1))/(v-u);
    D = (A(1) * v - B(1) * u)/(v-u);

    w = @(x) C .* cosh((x-D)./C);
    
    %determine lambda
    lambda = A(2) - w(A(1));

    w = @(x) w(x) + lambda;
    
    dw = @(x) sinh((x-D)./C);

    x_min = fzero(dw, A(1));

    T1 = [x_min;w(x_min)];
end