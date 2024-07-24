function root = fixed_point(g, x, tol)
    i = 0;
    prev = x-1;
    while abs(prev-x) > tol
        prev = x;
        x = g(x);
        i = i+1;
    end
    root = x;

