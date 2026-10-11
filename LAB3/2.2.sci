n = -6:6;

x = zeros(1, length(n));
x(n == -1) = 1;
x(n == 0) = 1;
x(n == 1) = 1;
x(n == 2) = 1;
x(n == 3) = 0.5;
x(n == 4) = 0.5;

ya = zeros(1, length(n));
for i = 1:length(n)
    idx = find(n == (n(i) - 2));
    if ~isempty(idx) then
        ya(i) = x(idx);
    end
end

yb = zeros(1, length(n));
for i = 1:length(n)
    idx = find(n == (4 - n(i)));
    if ~isempty(idx) then
        yb(i) = x(idx);
    end
end

yc = zeros(1, length(n));
for i = 1:length(n)
    idx = find(n == (n(i) + 2));
    if ~isempty(idx) then
        yc(i) = x(idx);
    end
end

u_2_n = zeros(1, length(n));
u_2_n(n <= 2) = 1;
yd = x .* u_2_n;

ye = zeros(1, length(n));
idx_2 = find(n == 2);
idx_3 = find(n == 3);
ye(idx_3) = x(idx_2);

yf = zeros(1, length(n));
for i = 1:length(n)
    n_sq = n(i)^2;
    idx = find(n == n_sq);
    if ~isempty(idx) then
        yf(i) = x(idx);
    end
end

x_neg = zeros(1, length(n));
for i = 1:length(n)
    idx = find(n == -n(i));
    if ~isempty(idx) then
        x_neg(i) = x(idx);
    end
end

yg = 0.5 * (x + x_neg);
yh = 0.5 * (x - x_neg);

figure();
clf();

subplot(4, 2, 1);
plot2d3(n, ya, style=1);
title("a) x(n - 2)");
xlabel("n"); ylabel("y_a(n)");
a = gca(); a.data_bounds = [-6, -0.6; 6, 1.2];

subplot(4, 2, 2);
plot2d3(n, yb, style=1);
title("b) x(4 - n)");
xlabel("n"); ylabel("y_b(n)");
a = gca(); a.data_bounds = [-6, -0.6; 6, 1.2];

subplot(4, 2, 3);
plot2d3(n, yc, style=1);
title("c) x(n + 2)");
xlabel("n"); ylabel("y_c(n)");
a = gca(); a.data_bounds = [-6, -0.6; 6, 1.2];

subplot(4, 2, 4);
plot2d3(n, yd, style=1);
title("d) x(n)u(2 - n)");
xlabel("n"); ylabel("y_d(n)");
a = gca(); a.data_bounds = [-6, -0.6; 6, 1.2];

subplot(4, 2, 5);
plot2d3(n, ye, style=1);
title("e) x(n - 1)delta(n - 3)");
xlabel("n"); ylabel("y_e(n)");
a = gca(); a.data_bounds = [-6, -0.6; 6, 1.2];

subplot(4, 2, 6);
plot2d3(n, yf, style=1);
title("f) x(n^2)");
xlabel("n"); ylabel("y_f(n)");
a = gca(); a.data_bounds = [-6, -0.6; 6, 1.2];

subplot(4, 2, 7);
plot2d3(n, yg, style=1);
title("g) even part x_e(n)");
xlabel("n"); ylabel("x_e(n)");
a = gca(); a.data_bounds = [-6, -0.6; 6, 1.2];

subplot(4, 2, 8);
plot2d3(n, yh, style=1);
title("h) odd part x_o(n)");
xlabel("n"); ylabel("x_o(n)");
a = gca(); a.data_bounds = [-6, -0.6; 6, 1.2];
