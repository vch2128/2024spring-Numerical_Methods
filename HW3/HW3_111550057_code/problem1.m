disp('< Promblem 1 >')

x = [-0.2, 0.3, 0.7, -0.3, 0.1];
fx = [1.23, 2.34, -1.05, 6.51, -0.06];
div_table = divided_diff(x,fx);
disp('(a)');
disp('divided difference table:');
disp(div_table);

disp('(b)');
p = @(k) fx(1) + (k-x(1))*div_table(2,2) + (k-x(1))*(k-x(2))*div_table(3,3);
disp(['p(0.4) = ',num2str(p(0.4))]);

disp('(c)');
abs_diff = abs(x - 0.4);  % calculate the distance between x and 0.4 
[~, sorted_indices] = sort(abs_diff);    % sort based on the distance
x = x(sorted_indices);
fx = fx(sorted_indices);

best_table = divided_diff(x, fx);
disp('divided difference table:');
disp(best_table);
p = @(k) fx(1) + (k-x(1))*best_table(2,2) + (k-x(1))*(k-x(2))*best_table(3,3);
disp(['p(0.4) = ',num2str(p(0.4))]);

% fplot(p,[-1,1]);
% hold on;
% scatter(x, fx, 100, 'r', 'filled'); % Plot red filled dots
% hold off;

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