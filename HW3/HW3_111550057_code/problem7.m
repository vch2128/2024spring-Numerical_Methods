% Problem 7
disp('< Promblem 7 >')
f= @(x) x.^2 - 1;
x0 = -1;
T = 3;

a0 = (1 / T) * integral(f, -1, 2);

n_terms = 5; % Number of Fourier coefficients to compute

an = zeros(1, n_terms);
bn = zeros(1, n_terms);

% Fourier coefficients
for n = 1:n_terms
    an(n) = (2 / T) * integral(@(x) f(x) .* cos(2*pi*n*x / T), -1, 2);
    bn(n) = (2 / T) * integral(@(x) f(x) .* sin(2*pi*n*x / T), -1, 2);
end

fprintf('a0 = %.4f\n', a0);
for n = 1:n_terms
    fprintf('a%d = %.4f, b%d = %.4f\n', n, an(n), n, bn(n));
end
disp(' ')