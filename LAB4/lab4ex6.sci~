clear; clc; 
if winsid() ~= [] then close(winsid()); end

x = [1, 2, -3, 2, 1];
h = [1, 0, -1];

Nx = length(x);
Nh = length(h);
Ny = Nx + Nh - 1;

y_fold = zeros(1, Ny);
x_padded = [zeros(1, Nh - 1), x, zeros(1, Nh - 1)];
h_folded = h($:-1:1);

for n = 1:Ny
    x_segment = x_padded(n : n + Nh - 1);
    y_fold(n) = sum(x_segment .* h_folded);
end

X_mat = zeros(Ny, Nh);
for col = 1:Nh
    X_mat(col : col + Nx - 1, col) = x';
end
y_matrix = X_mat * h';

nx = 0 : Nx - 1;
ny = 0 : Ny - 1;

Ex_n = x .^ 2;
Ey_n = y_fold .^ 2;
Ex_total = sum(Ex_n);
Ey_total = sum(Ey_n);

scf(1);

subplot(2, 2, 1);
plot2d3(nx, x, style=2); plot(nx, x, 'ro');
xtitle("Tin hieu x(n)");

subplot(2, 2, 2);
plot2d3(ny, y_fold, style=5); plot(ny, y_fold, 'bo');
xtitle("Tin hieu y(n)");

subplot(2, 2, 3);
plot2d3(nx, Ex_n, style=3); plot(nx, Ex_n, 'g*');
xtitle("Ex(n) = |x(n)|^2", "n", "Ex(n)");

subplot(2, 2, 4);
plot2d3(ny, Ey_n, style=6); plot(ny, Ey_n, 'm*');
xtitle("Ey(n) = |y(n)|^2", "n", "Ey(n)");
