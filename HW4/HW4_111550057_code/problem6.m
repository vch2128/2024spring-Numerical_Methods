f = @(x,y) (x-1).^2 + y.^2 / 16;
x_min = -2;
x_max = 3;
y_min = -1;
y_max = 2;

N = 100;   % number of random points
x_rand = x_min + (x_max - x_min) * rand(N, 1);
y_rand = y_min + (y_max - y_min) * rand(N, 1);

f_values = f(x_rand, y_rand);
approx = (x_max - x_min) * (y_max - y_min) * (1/N) * sum(f_values);
disp(['N = ',num2str(N)])
disp(approx)

N = 10000;   % number of random points
x_rand = x_min + (x_max - x_min) * rand(N, 1);
y_rand = y_min + (y_max - y_min) * rand(N, 1);

f_values = f(x_rand, y_rand);
approx = (x_max - x_min) * (y_max - y_min) * (1/N) * sum(f_values);
disp(['N = ',num2str(N)])
disp(approx)

N = 1000000;   % number of random points
x_rand = x_min + (x_max - x_min) * rand(N, 1);
y_rand = y_min + (y_max - y_min) * rand(N, 1);

f_values = f(x_rand, y_rand);
approx = (x_max - x_min) * (y_max - y_min) * (1/N) * sum(f_values);
disp(['N = ',num2str(N)])
disp(approx)

ana = integral2(f,x_min,x_max,y_min,y_max);
disp('Analytical solution')
disp(ana);