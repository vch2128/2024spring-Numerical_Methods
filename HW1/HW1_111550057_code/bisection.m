function [root,iter] = bisection(f,x0,x1,tol)
    if f(x0) * f(x1) > 0
        error('Function has same sign at interval endpoints.');
    end
    iter = 0;
    while abs(x0-x1) > tol
        iter = iter+1;
        m = (x0+x1)/2;
        if f(m) == 0
            root = m;
            return;
        elseif f(m)*f(x0) < 0 
            x1 = m;
        else
            x0 = m;
        end
    end
        root = (x0+x1)/2;

