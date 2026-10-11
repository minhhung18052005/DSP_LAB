n = -4:8;

x = zeros(1, length(n));
x(n >= 0 & n <= 3) = 1;

x2 = zeros(1, length(n));
x2(n >= 2 & n <= 5) = 1;

yb = zeros(1, length(n));
for i = 1:length(n)
    n_sq = n(i)^2;
    idx = find(n == n_sq);
    if ~isempty(idx) then
        yb(i) = x(idx);
    end
end

yb_shift = zeros(1, length(n));
for i = 1:length(n)
    idx = find(n == (n(i) - 2));
    if ~isempty(idx) then
        yb_shift(i) = yb(idx);
    end
end

y2b = zeros(1, length(n));
for i = 1:length(n)
    n_sq = n(i)^2;
    idx = find(n == n_sq);
    if ~isempty(idx) then
        y2b(i) = x2(idx);
    end
end

figure(1); clf();
subplot(3, 2, 1); plot2d3(n, x, style=1); title("b.1) x(n)"); xlabel("n"); ylabel("x(n)"); a = gca(); a.data_bounds = [-4, -0.5; 8, 1.5];
subplot(3, 2, 2); plot2d3(n, yb, style=1); title("b.2) y(n) = x(n^2)"); xlabel("n"); ylabel("y(n)"); a = gca(); a.data_bounds = [-4, -0.5; 8, 1.5];
subplot(3, 2, 3); plot2d3(n, yb_shift, style=1); title("b.3) y(n-2)"); xlabel("n"); ylabel("y(n-2)"); a = gca(); a.data_bounds = [-4, -0.5; 8, 1.5];
subplot(3, 2, 4); plot2d3(n, x2, style=1); title("b.4) x2(n) = x(n-2)"); xlabel("n"); ylabel("x2(n)"); a = gca(); a.data_bounds = [-4, -0.5; 8, 1.5];
subplot(3, 2, 5); plot2d3(n, y2b, style=1); title("b.5) y2(n) = T[x2(n)]"); xlabel("n"); ylabel("y2(n)"); a = gca(); a.data_bounds = [-4, -0.5; 8, 1.5];

x_prev = zeros(1, length(n));
x2_prev = zeros(1, length(n));
for i = 1:length(n)
    idx = find(n == (n(i) - 1));
    if ~isempty(idx) then
        x_prev(i) = x(idx);
        x2_prev(i) = x2(idx);
    end
end

yc = x - x_prev;
yc_shift = zeros(1, length(n));
for i = 1:length(n)
    idx = find(n == (n(i) - 2));
    if ~isempty(idx) then
        yc_shift(i) = yc(idx);
    end
end
y2c = x2 - x2_prev;

figure(2); clf();
subplot(3, 2, 1); plot2d3(n, x, style=1); title("c.1) x(n)"); xlabel("n"); ylabel("x(n)"); a = gca(); a.data_bounds = [-4, -1.5; 8, 1.5];
subplot(3, 2, 2); plot2d3(n, yc, style=1); title("c.2) y(n) = x(n) - x(n-1)"); xlabel("n"); ylabel("y(n)"); a = gca(); a.data_bounds = [-4, -1.5; 8, 1.5];
subplot(3, 2, 3); plot2d3(n, yc_shift, style=1); title("c.3) y(n-2)"); xlabel("n"); ylabel("y(n-2)"); a = gca(); a.data_bounds = [-4, -1.5; 8, 1.5];
subplot(3, 2, 4); plot2d3(n, x2, style=1); title("c.4) x2(n) = x(n-2)"); xlabel("n"); ylabel("x2(n)"); a = gca(); a.data_bounds = [-4, -1.5; 8, 1.5];
subplot(3, 2, 5); plot2d3(n, y2c, style=1); title("c.5) y2(n) = T[x2(n)]"); xlabel("n"); ylabel("y2(n)"); a = gca(); a.data_bounds = [-4, -1.5; 8, 1.5];


// --- CAU (d): y(n) = n*x(n) ---
yd = n .* x;
yd_shift = zeros(1, length(n));
for i = 1:length(n)
    idx = find(n == (n(i) - 2));
    if ~isempty(idx) then
        yd_shift(i) = yd(idx);
    end
end
y2d = n .* x2;

figure(3); clf();
subplot(3, 2, 1); plot2d3(n, x, style=1); title("d.1) x(n)"); xlabel("n"); ylabel("x(n)"); a = gca(); a.data_bounds = [-4, -0.5; 8, 5.5];
subplot(3, 2, 2); plot2d3(n, yd, style=1); title("d.2) y(n) = n*x(n)"); xlabel("n"); ylabel("y(n)"); a = gca(); a.data_bounds = [-4, -0.5; 8, 5.5];
subplot(3, 2, 3); plot2d3(n, yd_shift, style=1); title("d.3) y(n-2)"); xlabel("n"); ylabel("y(n-2)"); a = gca(); a.data_bounds = [-4, -0.5; 8, 5.5];
subplot(3, 2, 4); plot2d3(n, x2, style=1); title("d.4) x2(n) = x(n-2)"); xlabel("n"); ylabel("x2(n)"); a = gca(); a.data_bounds = [-4, -0.5; 8, 5.5];
subplot(3, 2, 5); plot2d3(n, y2d, style=1); title("d.5) y2(n) = T[x2(n)]"); xlabel("n"); ylabel("y2(n)"); a = gca(); a.data_bounds = [-4, -0.5; 8, 5.5];
