digits(10);

f = @(x,y) exp(1).^x .* sin(2.*y);
xmin = -0.2;
xmax = 1.4;
ymin = 0.4;
ymax = 2.6;
q = vpa(integral2(f, xmin, xmax, ymin, ymax));
disp('Analytical solution:')
disp(q)

h = 0.1;

% trapezoidal rule
ix = zeros(17,1);
for i = 0:16   % x
    xcur = xmin + h*i;
    % y
    temp = f(xcur , ymin);
    for j = 1:21  
        temp = temp + 2 * f(xcur, ymin+h*j);
    end
    temp = temp + f(xcur, ymax);
    ix(i+1) = temp * (h/2) ;
end

tra = ix(1) + ix(17);
for i = 2:16
    tra = tra + 2*ix(i);
end
tra = tra * (h/2);
disp('By trapezoidal rule:')
disp(vpa(tra))

% Simpson 1/3
ix = zeros(17,1);
for i = 0:16   % x
    xcur = xmin + h*i;
    % y
    temp = f(xcur , ymin);
    for j = 1:21 
        if rem(j,2)==1 
            fac = 4;
        else
            fac = 2;
        end
        temp = temp + fac * f(xcur, ymin+h*j);
    end
    temp = temp + f(xcur, ymax);
    ix(i+1) = temp * (h/3) ;
end

sim = ix(1) + ix(17);
for i = 2:16
    if rem(i,2)==0 
        fac = 4;
    else
        fac = 2;
    end
    sim = sim + fac*ix(i);
end
sim = sim * (h/3);
disp('By Simpson 1/3:')
disp(vpa(sim))

% 3-term Gaussian
t = [-0.77459667, 0, 0.77459667];
w = [0.55555555, 0.88888889, 0.55555555];

f21 = @(u) exp(1).^(0.6+0.8.*u);
f22 = @(v) sin(3+2.2.*v);

sum21 = w(1)*f21(t(1)) + w(2)*f21(t(2)) + w(3)*f21(t(3));
sum22 = w(1)*f22(t(1)) + w(2)*f22(t(2)) + w(3)*f22(t(3));
gau = 0.88 * sum21 *sum22;
disp('3-term Gaussian formula:')
disp(vpa(gau))

