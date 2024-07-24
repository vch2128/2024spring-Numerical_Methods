
f1 = @(x)  4.*x.^3 - 3.*x.^2 + 2.*x - 1;
[root, iter] = mullers(f1,0.6,0,1,1e-5);
disp('(a)')
disp(['root near x=0.6: ',num2str(root)])


f2 = @(x) x.^2 + exp(1) .* x - 5;
% X = linspace(-2*pi,2*pi,200);
% plot(X,f2(X))
% grid on
[root1, iter1] = mullers(f2,1,0,2,1e-5);
[root2, iter2] = mullers(f2,-2,-3,-1,1e-5);
disp('(b)')
disp(['root near x=1: ',num2str(root1)])
disp(['root near x=-2: ',num2str(root2)])