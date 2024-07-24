% Problem 3
disp('< Promblem 3 >')
pt1 = [0; 0];
pt2 = [1; 0.3];
pt3 = [2; 1.7];
pt4 = [3; 1.5];

u = linspace(0,1,100);
bezier_curve = kron((1-u).^3,pt1) + kron((3*u.*(1-u).^2),pt2) + kron((3*(u.^2).*(1-u)), pt3) + kron((u.^3),pt4);

plot(bezier_curve(1,:), bezier_curve(2,:), 'b-', 'LineWidth', 2); % Plot the bezier curve
hold on;
plot([pt1(1), pt2(1)], [pt1(2), pt2(2)], 'r-');  % Plot line from pt1 to pt2
plot([pt2(1), pt3(1)], [pt2(2), pt3(2)], 'r-'); % Plot line from pt2 to pt3
plot([pt3(1), pt4(1)], [pt3(2), pt4(2)], 'r-'); % Plot line from pt3 to pt4
scatter(pt1(1), pt1(2), 50, 'r', 'filled'); % Plot red filled dots
scatter(pt2(1), pt2(2), 50, 'r', 'filled');
scatter(pt3(1), pt3(2), 50, 'r', 'filled');
scatter(pt4(1), pt4(2), 50, 'r', 'filled');
grid on;
hold off;


% u=1/3 -> x=1, y=0.3
% u=2/3 -> x=2, y=1.7
% Define equations for points pt2 and pt3
syms a b;
eqns = [(1 - (1/3).^3) * pt1(2) + 3 * (1/3) * (1 - 1/3).^2 * (0.3 + a) + 3 * ((1/3)^2) * (1 - 1/3) * (1.7 + b) + ((1/3)^3) * pt4(2) - 0.3 == 0,
        (1 - (2/3).^3) * pt1(2) + 3 * (2/3) * (1 - 2/3).^2 * (0.3 + a) + 3 * ((2/3)^2) * (1 - 2/3) * (1.7 + b) + ((2/3)^3) * pt4(2) - 1.7 == 0 ];

% Solve the equations
sol = solve(eqns,a,b);

% Display the results
a_val = double(sol.a);
b_val = double(sol.b);
ctl_pt2 = [1; 0.3 + a_val];
ctl_pt3 = [2; 1.7 + b_val];

disp('new point 2:')
disp(ctl_pt2')
disp('new point 3:')
disp(ctl_pt3')

% bezier_curve2 = kron((1-u).^3,pt1) + kron((3*u.*(1-u).^2),ctl_pt2) + kron((3*(u.^2).*(1-u)), ctl_pt3) + kron((u.^3),pt4);
% plot(bezier_curve2(1,:), bezier_curve2(2,:), 'b-', 'LineWidth', 2); % Plot the bezier curve
% hold on;
% plot([pt1(1), ctl_pt2(1)], [pt1(2), ctl_pt2(2)], 'r-');  % Plot line from pt1 to ctl_pt2
% plot([ctl_pt2(1), ctl_pt3(1)], [ctl_pt2(2), ctl_pt3(2)], 'r-'); % Plot line from ctl_pt2 to ctl_pt3
% plot([ctl_pt3(1), pt4(1)], [ctl_pt3(2), pt4(2)], 'r-'); % Plot line from ctl_pt3 to pt4
% scatter(pt1(1), pt1(2), 50, 'r', 'filled'); % Plot red filled dots
% scatter(pt2(1), pt2(2), 50, 'r', 'filled');
% scatter(pt3(1), pt3(2), 50, 'r', 'filled');
% scatter(pt4(1), pt4(2), 50, 'r', 'filled');
% scatter(ctl_pt3(1), ctl_pt3(2), 50, 'g', 'filled'); % Plot red filled dots
% scatter(ctl_pt2(1), ctl_pt2(2), 50, 'g', 'filled');
% grid on;
% hold off;

disp(' ')