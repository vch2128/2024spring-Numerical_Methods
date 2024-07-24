
f = @(x)x.*sin((x-2)./(x-1));
tol = 1e-5;

% X = linspace(-2*pi,2*pi,200);
% plot(X,f(X))
% grid on

roots = zeros(4,1);
iters = zeros(4,1);
roots2 = zeros(4,1);
iters2 = zeros(4,1);

bounds = {[0.78, 0.85], [0.8525, 0.9787], [0.9788, 1.0419], [1.042, 1.105]};

for i=1:length(bounds)
    [roots(i),iters(i)]=bisection(f,bounds{i}(2),bounds{i}(1),tol);
end

% differences = abs(roots - 0.95);
% [~, index] = max(differences);
% fourroots = roots([1:index-1, index+1:end]);

% Display roots
disp('Bisection:');
disp(roots);
% for i=1:length(roots)
%     disp(['f(',num2str(roots(i)),')=',num2str(f(roots(i)))])
% end
disp('Bisection iterations:');
disp(sum(iters));

for i=1:length(bounds)
    [roots2(i),iters2(i)]=secant(f,bounds{i}(1),bounds{i}(2),tol);
end

disp('Secant:');
disp(roots2);
% for i=1:length(roots2)
%     disp(['f(',num2str(roots2(i)),')=',num2str(f(roots2(i)))])
% end
disp('Secant iterations:');
disp(sum(iters2));



