function [yn, yorigin] = delay(xn, xorigin, k)
    yn = xn;
    yorigin = xorigin - k;
    nx = (1:length(xn)) - xorigin;
    ny = nx + k;
    figure(); clf();
    
    subplot(2, 1, 1);
    plot2d3(nx, xn, style=1);
    title("Tín hiệu gốc x(n)");
    xlabel("n"); ylabel("x(n)");
    a1 = gca(); a1.data_bounds = [min(nx)-1, min(xn)-1; max(ny)+1, max(xn)+1];
    
    subplot(2, 1, 2);
    plot2d3(ny, yn, style=1);
    title("Tín hiệu trễ y(n) = x(n - " + string(k) + ")");
    xlabel("n"); ylabel("y(n)");
    a2 = gca(); a2.data_bounds = [min(nx)-1, min(xn)-1; max(ny)+1, max(xn)+1];
endfunction

[yn, yorigin] = delay([1, -2, 3, 6], 3, 1);

mprintf("yn = "); disp(yn);
mprintf("yorigin = %d\n", yorigin);
