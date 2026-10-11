function [yn, yorigin] = convolution(xn, xorigin, hn, horigin)
    yn = convol(xn, hn);
    yorigin = xorigin + horigin - 1;
    
    nx = (1:length(xn)) - xorigin;
    nh = (1:length(hn)) - horigin;
    ny = (1:length(yn)) - yorigin;
    
    figure();
    clf();
    
    subplot(3, 1, 1);
    plot2d3(nx, xn, style=1);
    title("x(n)");
    xlabel("n");
    ylabel("x(n)");
    a1 = gca();
    a1.data_bounds = [min([nx, nh, ny])-1, min([xn, hn, yn])-1; max([nx, nh, ny])+1, max([xn, hn, yn])+1];
    
    subplot(3, 1, 2);
    plot2d3(nh, hn, style=1);
    title("h(n)");
    xlabel("n");
    ylabel("h(n)");
    a2 = gca();
    a2.data_bounds = [min([nx, nh, ny])-1, min([xn, hn, yn])-1; max([nx, nh, ny])+1, max([xn, hn, yn])+1];
    
    subplot(3, 1, 3);
    plot2d3(ny, yn, style=1);
    title("y(n) = x(n) * h(n)");
    xlabel("n");
    ylabel("y(n)");
    a3 = gca();
    a3.data_bounds = [min([nx, nh, ny])-1, min([xn, hn, yn])-1; max([nx, nh, ny])+1, max([xn, hn, yn])+1];
endfunction
[yn, yorigin] = convolution([2,3,-1,2], 2, [2,1,-1], 2)
mprintf("yn = "); disp(yn);
mprintf("yorigin = %d\n", yorigin);
