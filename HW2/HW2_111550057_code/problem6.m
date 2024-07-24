A = [2,-2;
     -2,2];
% A = [2,-1.99;
%      -1.99,2];
b = [0;0];
s1 = [1;1];
s2 = [1;-1];
s3 = [-1;1];
s4 = [2;5];
s5 = [5;2];

max_iter = 1000;
[x1, iter1] = jacobi(A, b, s1, max_iter);
[x2, iter2] = jacobi(A, b, s2, max_iter);
[x3, iter3] = jacobi(A, b, s3, max_iter);
[x4, iter4] = jacobi(A, b, s4, max_iter);
[x5, iter5] = jacobi(A, b, s5, max_iter);

% [x1, iter1] = gauss_seidel(A, b, s1, max_iter);
% [x2, iter2] = gauss_seidel(A, b, s2, max_iter);
% [x3, iter3] = gauss_seidel(A, b, s3, max_iter);
% [x4, iter4] = gauss_seidel(A, b, s4, max_iter);
% [x5, iter5] = gauss_seidel(A, b, s5, max_iter);

disp('x1=')
disp(x1)
disp(['iterations: ',num2str(iter1)])
disp('x2=')
disp(x2)
disp(['iterations: ',num2str(iter2)])
disp('x3=')
disp(x3)
disp(['iterations: ',num2str(iter3)])
disp('x4=')
disp(x4)
disp(['iterations: ',num2str(iter4)])
disp('x5=')
disp(x5)
disp(['iterations: ',num2str(iter5)])

