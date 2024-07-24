% Plot the graph
y1 = (104 - 0.1*x) / 51.7;
y2 = (5.1*x - 16) / 7.3;
x =  linspace(0,10,100);
plot(x, y1, 'b', 'LineWidth', 2); % First line (blue)
hold on; % Hold the current plot
plot(x, y2, 'r', 'LineWidth', 2); % Second line (red)
grid on;
hold off;