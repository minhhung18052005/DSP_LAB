clear; clc;
if winsid() ~= [] then close(winsid()); end

x = [1, 2, -3, 2, 1];
h = [1, 0, -1, -1, 1];
N = length(x);
M = length(h);

y_fold = zeros(1, N);
for n = 0:N-1
    sum_val = 0;
    for k = 0:M-1
        idx_x = pmodulo(n - k, N) + 1;
        idx_h = k + 1;
        sum_val = sum_val + h(idx_h) * x(idx_x);
    end
    y_fold(n + 1) = sum_val;
end

disp("Ket qua y(n) (Phuong phap Gap & Dich):");
disp(y_fold);

X_circ = zeros(N, N);
for r = 1:N
    for c = 1:N
        idx = pmodulo((r - 1) - (c - 1), N) + 1;
        X_circ(r, c) = x(idx);
    end
end
y_matrix = X_circ * h';

disp("Ma tran xoay X_circ:");
disp(X_circ);
disp("Ket qua y(n) (Phuong phap Ma tran):");
disp(y_matrix');

n = 0 : N - 1;
Ex_n = x .^ 2;
Ey_n = y_fold .^ 2;
Ex_total = sum(Ex_n);
Ey_total = sum(Ey_n);

scf(1);

subplot(2, 2, 1);
plot2d3(n, x, style=2); plot(n, x, 'ro');
xtitle("Tin hieu x(n) [Tong Ex = " + string(Ex_total) + "]", "n", "x(n)");

subplot(2, 2, 2);
plot2d3(n, y_fold, style=5); plot(n, y_fold, 'bo');
xtitle("Tin hieu y(n) [Tong Ey = " + string(Ey_total) + "]", "n", "y(n)");

subplot(2, 2, 3);
plot2d3(n, Ex_n, style=3); plot(n, Ex_n, 'g*');
xtitle("Nang luong tuc thoi Ex(n) = |x(n)|^2", "n", "Ex(n)");

subplot(2, 2, 4);
plot2d3(n, Ey_n, style=6); plot(n, Ey_n, 'm*');
xtitle("Nang luong tuc thoi Ey(n) = |y(n)|^2", "n", "Ey(n)");
