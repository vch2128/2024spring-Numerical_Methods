function [x,iter] = jacobi(A, b, x0, max_iter)
    % Initialize variables
    n = length(b);
    x = x0;
    iter = 0;
    x_prev = x0;
    for i=1:(n-1)     % Check if diagonally dominant
        [~,max_row] = max(abs(A(i:n, i)));
        max_row = max_row +i -1;
        if max_row ~= i
            % swap max_row and i
            A([max_row,i], :) = A([i, max_row], :);
            b([max_row,i], :) = b([i, max_row], :);
        end
    end
    
    % Iterate until convergence or max iterations
    while iter < max_iter
        for j = 1 : n
            x(j) = (b(j)/A(j,j)) - ((A(j,[1:j-1,j+1:n]) * x_prev([1:j-1,j+1:n])) / A(j,j));
        end
        
        % Check for convergence 
        x_prev_r = round(x_prev,5,'significant');
        rounded_x = round(x,5,'significant');
        if x_prev_r == rounded_x
            break
        end
        iter = iter + 1;   % increment iteration counter
        x_prev = x;
    end
end
