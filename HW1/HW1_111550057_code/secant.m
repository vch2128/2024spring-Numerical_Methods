function [x2,iter] = secant(f,x0,x1,tol)
    iter = 0;
    while abs(x1-x0) > tol 
        if abs(f(x0)) < abs(f(x1))
            temp = x0;
            x0 = x1;
            x1 = temp;
        end
        x2 = (x0*f(x1)-x1*f(x0))/(f(x1)-f(x0));
        x0 = x1;
        x1 = x2;
        iter = iter+1;
    end
