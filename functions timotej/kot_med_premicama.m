function phi = kot_med_premicama(p1, p2)
    % podamo kot v smislu smernih vektorjev,
    % cosphi = sum(p1 .* p2) / norm(p1) / norm(p2);
    % phi = min([acos(cosphi),pi-acos(cosphi)]);
    % phi = acos(cosphi);
    m1 = p1(2)/p1(1);
    m2 = p2(2) /p2(1);
    tanphi = (m2-m1)/(1+m1*m2);
    phi = min(abs([atan(tanphi),pi-atan(tanphi)]));
end

