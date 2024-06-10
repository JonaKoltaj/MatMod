x = linspace(1,5);
figure
hold on
for i=1:5
    plot(x,x.^i)
    drawnow
end
