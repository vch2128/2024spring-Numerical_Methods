
disp('< Promblem 2 >')

x = [-1, -0.5, 0, 0.5, 1];
y = [0, 0, 1, 0, 0];

h = [0.5, 0.5, 0.5, 0.5];

H = [h(1), 2*(h(1)+h(2)), h(2),0, 0 ;
     0, h(2), 2*(h(2)+h(3)), h(3),0 ;
     0, 0, h(3), 2*(h(3)+h(4)), h(4)];

Y = [( (y(3)-y(2)) / h(2) ) - ( (y(2)-y(1)) / h(1) ) ;
     ( (y(4)-y(3)) / h(3) ) - ( (y(3)-y(2)) / h(2) ) ;
     ( (y(5)-y(4)) / h(4) ) - ( (y(4)-y(3)) / h(3) ) ];
Y = 6 .* Y;

% Method 3
syms k;
H = [ (3*h(1)+2*h(2)), h(2),0 ;
      h(2), 2*(h(2)+h(3)), h(3);
      0, h(3), (2*h(3)+3*h(4))];
s = H\Y;
S = [ s(1); s(1); s(2); s(3); s(3)];
a = zeros(1,4);
b = zeros(1,4);
c = zeros(1,4);
for i=1:4
    a(i) = (S(i+1)-S(i))/(6*h(i));
    b(i) = S(i)/2;
    c(i) = ((y(i+1)-y(i))/h(i)) - (2*h(i)*S(i) + h(i)*S(i+1)) / 6;
end
g1 = a(1)*(k-x(1))^3 + b(1)*(k-x(1))^2 + c(1)*(k-x(1)) + y(1);
g2 = a(2)*(k-x(2))^3 + b(2)*(k-x(2))^2 + c(2)*(k-x(2)) + y(2);
g3 = a(3)*(k-x(3))^3 + b(3)*(k-x(3))^2 + c(3)*(k-x(3)) + y(3);
g4 = a(4)*(k-x(4))^3 + b(4)*(k-x(4))^2 + c(4)*(k-x(4)) + y(4);

% Method 4
H = [ (h(1)+h(2))*(h(1)+2*h(2))/h(2) , (h(2)^2-h(1)^2)/h(2), 0 ;
      h(2), 2*(h(2)+h(3)), h(3);
      0,  (h(3)^2-h(4)^2)/h(3), (h(4)+h(3))*(h(4)+2*h(3))/h(3)];
s = H\Y;
S = [ ((h(1)+h(2))*s(1) - h(1)*s(2)) / h(2) ; 
      s(1); 
      s(2); 
      s(3); 
      ((h(3)+h(4))*s(3) - h(4)*s(2)) / h(3) ];
for i=1:4
    a(i) = (S(i+1)-S(i))/(6*h(i));
    b(i) = S(i)/2;
    c(i) = ((y(i+1)-y(i))/h(i)) - (2*h(i)*S(i) + h(i)*S(i+1)) / 6;
end
g1_2 = a(1)*(k-x(1))^3 + b(1)*(k-x(1))^2 + c(1)*(k-x(1)) + y(1);
g2_2 = a(2)*(k-x(2))^3 + b(2)*(k-x(2))^2 + c(2)*(k-x(2)) + y(2);
g3_2 = a(3)*(k-x(3))^3 + b(3)*(k-x(3))^2 + c(3)*(k-x(3)) + y(3);
g4_2 = a(4)*(k-x(4))^3 + b(4)*(k-x(4))^2 + c(4)*(k-x(4)) + y(4);


% Define the piecewise function
x_values = linspace(-1, 1, 1000);
f_values = zeros(size(x_values)); % Initialize f_values array

% Compute f(x) based on the piecewise definition
f_values(x_values > -1 & x_values < -0.5) = 0; 
f_values(x_values >= -0.5 & x_values <= 0.5) = 1 - abs(2 * x_values(x_values >= -0.5 & x_values <= 0.5)); 
f_values(x_values > 0.5 & x_values < 1) = 0; 

hold on
e1 = fplot(g1,[-1 -0.5],'b-', 'LineWidth', 2);
fplot(g2,[-0.5 0],'b-', 'LineWidth', 2);
fplot(g3,[0 0.5],'b-', 'LineWidth', 2);
fplot(g4,[0.5 1],'b-', 'LineWidth', 2);
e2 = fplot(g1_2,[-1 -0.5],'r-', 'LineWidth', 1);
fplot(g2_2,[-0.5 0],'r-', 'LineWidth', 1);
fplot(g3_2,[0 0.5],'r-', 'LineWidth', 1);
fplot(g4_2,[0.5 1],'r-', 'LineWidth', 1);
scatter(x, y, 70, 'k', 'filled');
plot(x_values, f_values, 'k-', 'LineWidth', 2); % Plot the piecewise function
legend([e1,e2],'Condition 3','Condition 4')
xlabel('x');
ylabel('f(x)');
grid on;
hold off;
