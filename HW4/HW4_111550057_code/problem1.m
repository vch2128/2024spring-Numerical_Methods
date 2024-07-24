
x = 0.3:0.2:1.5;
y = [0.3985, 0.6598, 0.9147, 1.1611, 1.3971, 1.6212, 1.8325];
div = divided_diff(x,y);

% (a)
f_a = @(x) div(3,2) + div(4,3)*(x-0.5+x-0.7) + div(5,4)*((x-0.5)*(x-0.7) + (x-0.7)*(x-0.9) + (x-0.5)*(x-0.9));
x_value = 0.72;
disp('(a)')
disp(f_a(x_value))

% (b)
f_b = @(x) div(6,2) + div(7,3)*(x-1.1+x-1.3);
x_value = 1.33;
disp('(b)')
disp(f_b(x_value))

% (c)
f_c = @(x) div(2,2) + div(3,3)*(x-0.3+x-0.5) + div(4,4)*((x-0.5)*(x-0.7) + (x-0.7)*(x-0.3) + (x-0.5)*(x-0.3)) +...
    div(5,5)*((x-0.3)*(x-0.5)*(x-0.7) + (x-0.9)*(x-0.5)*(x-0.7) + (x-0.3)*(x-0.9)*(x-0.7) + (x-0.3)*(x-0.5)*(x-0.9));
x_value = 0.5;
disp('(c)')
disp(f_c(x_value))


% calculate the divided difference table
function table = divided_diff(x,y)
    n = length(x);
    table = zeros(n,n);
    table(:,1) = y';   % first column is f(x)
    for j = 2:n
        for i = j:n
            % calculate the value based on the previous column
            table(i,j) = (table(i,j-1) - table(i-1,j-1)) / (x(i) - x(i-j+1));
        end
    end
end