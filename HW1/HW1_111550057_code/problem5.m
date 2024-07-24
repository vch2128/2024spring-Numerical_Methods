g_pos = @(x) sqrt((exp(1).^x)/2);
g_neg = @(x) -sqrt((exp(1).^x)/2);

% X = linspace(-2*pi,2*pi,200);
% plot(X,g_pos(X))
% grid on

disp('(a)')
root_pos = fixed_point(g_pos,0.5,1e-5);
disp(['root(positive):',num2str(root_pos)])
root_neg = fixed_point(g_neg,0.5,1e-5);
disp(['root(negative):',num2str(root_neg)])

disp('(b)')
root = fixed_point(g_pos,2.5,1e-5);
disp(['x=',num2str(root),'(positive g(x), starts at 2.5)'])
root = fixed_point(g_pos,2.7,1e-5);
disp(['x=',num2str(root),'(positive g(x), starts at 2.7)'])
root = fixed_point(g_neg,2.5,1e-5);
disp(['x=',num2str(root),'(negative g(x), starts at 2.5)'])
root = fixed_point(g_neg,2.7,1e-5);
disp(['x=',num2str(root),'(negative g(x), starts at 2.7)'])

g_r = @(x) log(2.*x.^2);
disp('(c)')
root = fixed_point(g_r,2.5,1e-5);
disp('g(x)=log(2*x^2)')
disp(['root:',num2str(root),'(starts at 2.5)'])
root = fixed_point(g_r,2.7,1e-5);
disp(['root:',num2str(root),'(starts at 2.7)'])
