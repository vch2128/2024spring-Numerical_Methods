function [root, iter] = mullers(f,x0,x1,x2,tol)
    iter = 0;
    root = 0;
    while abs(f(root)) > tol
        h1 = x1 - x0;
        h2 = x0 - x2;
        gamma = h2 ./ h1;
        c = f(x0);
        a = (gamma.*f(x1) - f(x0).*(1+gamma) + f(x2)) ./ (gamma .* h1.^2 .*(1+gamma));
        b = (f(x1)-f(x0)-a.*h1.^2) ./ h1;
        if b > 0
            root = x0 - (2.*c) ./ (b + sqrt(b.^2 - 4.*a.*c));
        else
            root = x0 - (2.*c) ./ (b - sqrt(b.^2 - 4.*a.*c));
        end
    
        if root > x0
            x2 = root;
        else
            x1 = x2;
            x2 = root;
        end
        iter = iter+1;
    end





    
    