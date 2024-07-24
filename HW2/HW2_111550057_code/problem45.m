A = [7, -3, 4; 
     -3, 2, 6;
     2, 5, 3];
b = [6; 2; -5];

start = [0;0;0];

[x_jacobi, iter_jacobi] = jacobi(A, b, start, 100);
disp('Jacobi')
disp('x = ')
disp(x_jacobi)
disp(['iterations used: ',num2str(iter_jacobi)])
[x_gauss, iter_gauss] = gauss_seidel(A, b, start, 100);
disp('Gauss-Seidel')
disp('x = ')
disp(x_gauss)
disp(['iterations used: ',num2str(iter_gauss)])