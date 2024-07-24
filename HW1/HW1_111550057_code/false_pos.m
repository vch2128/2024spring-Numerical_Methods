function [x2,iter] = false_pos(f,x0,x1,tol)
    if (f(x0) * f(x1)) > 0
        error('Function has same sign at interval endpoints.');
    end
    iter = 1;
    x2 = (x0*f(x1)-x1*f(x0))/(f(x1)-f(x0));
    if f(x2)*f(x0)<0
        x1 = x2;
    else
        x0 = x2;
    end
    while abs(f(x2)) > tol
        x2 = (x0*f(x1)-x1*f(x0))/(f(x1)-f(x0));
        if f(x2)*f(x0)<0
            x1 = x2;
        else
            x0 = x2;
        end
        iter = iter+1;
    end
