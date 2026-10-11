function [yn, yorigin] = multi(x1n, x1origin, x2n, x2origin)
    n1 = (1:length(x1n)) - x1origin;
    n2 = (1:length(x2n)) - x2origin;
    
    n = min(min(n1), min(n2)) : max(max(n1), max(n2));
    
    y1 = zeros(1, length(n));
    y2 = zeros(1, length(n));
    
    y1(n >= min(n1) & n <= max(n1)) = x1n;
    y2(n >= min(n2) & n <= max(n2)) = x2n;
    
    yn = y1 .* y2;
    yorigin = find(n == 0);
    
    figure();
    clf();
    
    subplot(3, 1, 1);
    plot2d3(n1, x1n, style=1);
    title("x1(n)");
    xlabel("n");
    ylabel("x1(n)");
    a1 = gca();
    a1.data_bounds = [min(n)-1, min([x1n, x2n, yn])-1; max(n)+1, max([x1n, x2n, yn])+1];
    
    subplot(3, 1, 2);
    plot2d3(n2, x2n, style=1);
    title("x2(n)");
    xlabel("n");
    ylabel("x2(n)");
    a2 = gca();
    a2.data_bounds = [min(n)-1, min([x1n, x2n, yn])-1; max(n)+1, max([x1n, x2n, yn])+1];
    
    subplot(3, 1, 3);
    plot2d3(n, yn, style=1);
    title("y(n) = x1(n) . x2(n)");
    xlabel("n");
    ylabel("y(n)");
    a3 = gca();
    a3.data_bounds = [min(n)-1, min([x1n, x2n, yn])-1; max(n)+1, max([x1n, x2n, yn])+1];
endfunction
[yn, yorigin] = multi([2,3,1,3,-2], 3,[3,5,1,2,4], 2);
mprintf("yn = "); disp(yn);
mprintf("yorigin = %d\n", yorigin);
