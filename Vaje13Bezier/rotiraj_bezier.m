function rotiraj_bezier(b,phi)
b_v_nic = b - b(:,1);
R = [cos(phi),-sin(phi);sin(phi),cos(phi)];
rotiran_b = b_v_nic;
for i=1:length(b)
    rotiran_b(:,i) = R*b_v_nic(:,i);
end
rotiran_b = rotiran_b + b(:,1);
plotBezier(b,'black','r')
plotBezier(rotiran_b,'b','green')

