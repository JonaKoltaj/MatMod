function p = tangenta_v_tocki(y, dy,x)
    p = @(t) y(x) + dy(x)*(t-x);
end

