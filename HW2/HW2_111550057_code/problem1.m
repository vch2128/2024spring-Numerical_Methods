A = [3, 1, -4;
     -2, 3, 1;
     2, 0, 5];
b = [7;
     -5;
     10];

x = gaussian_pivot(A,b);

[n, ~] = size(x);

for i = 1:n
    disp(['x',num2str(i),'=',num2str(x(i))])
end
