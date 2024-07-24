disp('< Promblem 5 >')
x = [0.40, 1.2, 3.4, 4.1, 5.7, 7.2, 9.3];
y = [0.70, 2.1, 4.0, 4.9, 6.3, 8.1, 8.9];
z = [0.031, 0.933, 3.058, 3.349, 4.870, 5.757, 8.921];

% z = a*x + b*y + c
syms a b c;
R = 0;
for i=1:7
    R = R + (z(i) - (x(i)*a + y(i)*b + c))^2;
end
Ra = diff(R, a) == 0;
Rb = diff(R, b) == 0;
Rc = diff(R, c) == 0;
disp('(a)')
disp(Ra);
disp(Rb);
disp(Rc);

disp('(b)')
disp('z = a*x + b*y + c')
eq = [Ra, Rb, Rc];
sol = solve(eq,[a, b, c]);
disp(sol);

disp('(c)')
a_value = sol.a;
b_value = sol.b;
c_value = sol.c;
R_value = subs(R, [a, b, c], [a_value, b_value, c_value]);
disp(R_value);