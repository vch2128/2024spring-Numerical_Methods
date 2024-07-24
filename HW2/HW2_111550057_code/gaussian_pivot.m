function x = gaussian_pivot(A,b)
    % Form augmented matrix
    aug = [A,b];

    % Forward elimination with partial pivoting
    for k = 1:n-1
        % Partial pivoting
        [~, max_row] = max(abs(aug(k:n, k)));   % [max number. max row]
        max_row = max_row + k - 1;
        if max_row ~= k
            % swap max_row and k
            aug([max_row,k], :) = aug([k, max_row], :);
        end
        
        % Forward elimination
        for i = k+1:n
            factor = aug(i,k) / aug(k,k);
            aug(i,k:n+1) = aug(i,k:n+1) - factor * aug(k,k:n+1);
        end
    end
    
    % Back substitution
    x = zeros(n,1);
    for k = n:-1:1
        x(k) = (aug(k,n+1) - aug(k,k+1:n) * x(k+1:n)) / aug(k,k);
    end
end
