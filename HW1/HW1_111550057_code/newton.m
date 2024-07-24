function x1 = newton(f,df,x0,tol)
    i = 0;
    while abs(f(x0)) > tol
        x1 = x0-f(x0)/df(x0);
        x0 = x1;
        i = i+1;
    end
end

