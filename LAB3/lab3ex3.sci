function [yn, yorigin] = fold(xn, xorigin)
    yn = xn($:-1:1);
    yorigin = length(xn) - xorigin + 1;
    
    nx = (1:length(xn)) - xorigin;
    ny = -nx($:-1:1);
    
    figure();
    clf();
    
    subplot(2, 1, 1);
    plot2d3(nx, xn, style=1);
    title("Tín hiệu x(n)");
    xlabel("n");
    ylabel("x(n)");
    a1 = gca();
    a1.data_bounds = [min([nx, ny])-1, min(xn)-1; max([nx, ny])+1, max(xn)+1];
    
    subplot(2, 1, 2);
    plot2d3(ny, yn, style=1);
    title("Tín hiệu y(n) = x(-n)");
    xlabel("n");
    ylabel("y(n)");
    a2 = gca();
    a2.data_bounds = [min([nx, ny])-1, min(xn)-1; max([nx, ny])+1, max(xn)+1];
endfunction
[yn, yorigin] = fold([2,1,-3,4,3], 2);
mprintf("yn = "); disp(yn);
mprintf("yorigin = %d\n", yorigin);
