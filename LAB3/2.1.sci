n = -7:7;

x = zeros(1, length(n));
for i = 1:length(n)
    ni = n(i);
    if ni >= -3 & ni <= -1 then
        x(i) = 1 + ni/3;
    elseif ni >= 0 & ni <= 3 then
        x(i) = 1;
    end
end

y_b1 = zeros(1, length(n));
for i = 1:length(n)
    ni = -n(i) + 4;
    if ni >= -3 & ni <= -1 then
        y_b1(i) = 1 + ni/3;
    elseif ni >= 0 & ni <= 3 then
        y_b1(i) = 1;
    end
end

y_b2 = zeros(1, length(n));
for i = 1:length(n)
    ni = -n(i) - 4;
    if ni >= -3 & ni <= -1 then
        y_b2(i) = 1 + ni/3;
    elseif ni >= 0 & ni <= 3 then
        y_b2(i) = 1;
    end
end

figure();
clf();

subplot(2, 2, 1);
plot2d3(n, x, style=1);
title("a) x(n)");
xlabel("n"); ylabel("x(n)");
a1 = gca(); a1.data_bounds = [-8, -0.5; 8, 1.5];

subplot(2, 2, 2);
plot2d3(n, y_b1, style=1);
title("b.(1).");
xlabel("n"); ylabel("y1(n)");
a2 = gca(); a2.data_bounds = [-8, -0.5; 8, 1.5];

subplot(2, 2, 3);
plot2d3(n, y_b2, style=1);
title("b.(2) ");
xlabel("n"); ylabel("y2(n)");
a3 = gca(); a3.data_bounds = [-8, -0.5; 8, 1.5];

subplot(2, 2, 4);
plot2d3(n, y_b1, style=1);
title("c) x(-n+4)");
xlabel("n"); ylabel("x(-n+4)");
a4 = gca(); a4.data_bounds = [-8, -0.5; 8, 1.5];
