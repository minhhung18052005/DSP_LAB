n = -2:2;
x = [2, 3, 4, 5, 6];
x_fold = x($:-1:1);

xe = 0.5 * (x + x_fold);
xo = 0.5 * (x - x_fold);

figure();
clf();

subplot(3, 1, 1);
plot2d3(n, x, style=1);
title("x(n)");
xlabel("n");
ylabel("x(n)");
a1 = gca();
a1.data_bounds = [-3, -3; 3, 7];

subplot(3, 1, 2);
plot2d3(n, xe, style=1);
title("Even x(n)");
xlabel("n");
ylabel("x_e(n)");
a2 = gca();
a2.data_bounds = [-3, -3; 3, 7];

subplot(3, 1, 3);
plot2d3(n, xo, style=1);
title("Odd x(n)");
xlabel("n");
ylabel("x_o(n)");
a3 = gca();
a3.data_bounds = [-3, -3; 3, 7];
