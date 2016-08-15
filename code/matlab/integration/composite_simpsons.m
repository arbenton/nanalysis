function [v] = composite_simpsons(f, a, b, n)

    % Composite Simpsons Formula for Integration
    %
    % Solves int_a^b f(x) dx across n panels.
    %
    % Error : e <= h^5 / 90 sum_{j=1}^{n/2} f^(4)(xi)
    %
    % Arguments:
    %   f : function
    %   a : lower bound
    %   b : upper bound
    %   n : number of intervals
    % Returns:
    %   v : value of integral

    h = (b - a)/n;
    xi0 = f(a) + f(b);
    xi1 = 0;
    xi2 = 0;

    for i=1:n-1
        x = a+i*h;
        if mod(i, 2)
            xi1 = xi1 + f(x);
        else
            xi2 = xi2 + f(x);
        end
    end

    v = h*(xi0 + 2*xi2 + 4*xi1)/3;

end
