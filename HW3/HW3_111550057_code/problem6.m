E1 = @(x) 1 - (1/2)*x.^2 + (1/24)*x.^4 - cos(x);
E2 = @(x) 0.9999 - 0.4988*x.^2 + 0.0392*x.^4 - cos(x);
x_val = linspace(-1,1,200);
y1 = E1(x_val);
y2 = E2(x_val);

% Plot the functions
plot(x_val, y1, 'b', x_val, y2, 'r');
xlabel('x');
ylabel('E(x)');
legend('Maclaurin', 'Chebyshev', 'Location', 'best');
grid on;