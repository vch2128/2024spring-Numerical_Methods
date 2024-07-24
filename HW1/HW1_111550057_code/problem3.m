f =@(x) (x-2).^3 .* (x-4).^2;

bound = [1,5];
tol = 1e-5;

[root_bisection, iter_b] = bisection(f,bound(2),bound(1),tol);
[root_secant, iter_s] = secant(f,bound(1),bound(2),tol);
disp(['bisection:',num2str(root_bisection)])
disp(['secant:',num2str(root_secant)])

[root_fp, iter_fp] = false_pos(f,bound(1),bound(2),tol);

disp(['false position:',num2str(root_fp)])

