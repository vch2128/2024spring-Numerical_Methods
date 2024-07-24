digits(8)

f = @(x) sin(x)./x;
q = vpa(integral(f,0,1));
disp('True answer:')
disp(q)

% Simpson's 1/3 rule, h = 0.5
h = 0.5;
x0 = 0;
x1 = 0.5;
x2 = 1;
approx1 = vpa((h/3) * ( 1 + 4*f(x1) + f(x2) )) ;
disp('Simpson, h = 0.5:')
disp(approx1)

% Simpson's 1/3 rule, h = 0.25
h = 0.25;
x0 = 0;
x1 = 0.25;
x2 = 0.5;
x3 = 0.75;
x4 = 1;
approx2 = vpa((h/3) * ( 1 + 4*f(x1) + 2*f(x2) + 4*f(x3) + f(x4) ));
disp('Simpson, h = 0.25:')
disp(approx2)

% Extrapolation (reach 5th order)
ex = vpa((approx2 - (approx1/32)) * (32/31));
disp('Extrapolation:')
disp(ex)
