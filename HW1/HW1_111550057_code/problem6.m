f = @(x) (cos(x)).^4 + x.^2 -x -2;
df = @(x) -4.*(cos(x)).^3.*sin(x) + 2.*x -1;

% X = linspace(-2*pi,2*pi,200);
% plot(X,f(X))
% grid on

root = newton(f,df,-2,1e-5);
disp(['root(x0=-2):',num2str(root),])
root = newton(f,df,3,1e-5);
disp(['root(x0=3):',num2str(root)])
