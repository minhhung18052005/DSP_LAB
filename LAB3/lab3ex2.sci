function [yn, yorigin] = advance(xn, xorigin, k)
    yn = xn;
    yorigin = xorigin + k;
    
    nx = (1:length(xn)) - xorigin;
    ny = nx - k;
    
    figure();
    clf();
    
    subplot(2, 1, 1);
    plot2d3(nx, xn, style=1);
    title("Tín hiệu x(n)");
    xlabel("n");
    ylabel("x(n)");
    a1 = gca();
    a1.data_bounds = [min(ny)-1, min(xn)-1; max(nx)+1, max(xn)+1];
    
    subplot(2, 1, 2);
    plot2d3(ny, yn, style=1);
    title("Tín hiệu y(n) = x(n + " + string(k) + ")");
    xlabel("n");
    ylabel("y(n)");
    a2 = gca();
    a2.data_bounds = [min(ny)-1, min(xn)-1; max(nx)+1, max(xn)+1];
endfunction
[yn, yorigin] = advance([1,3,-1,2,3], 3, 2);
mprintf("yn = "); disp(yn);
mprintf("yorigin = %d\n", yorigin);
