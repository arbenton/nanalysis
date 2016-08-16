function [v] = composite_trapezoidal(f, a, b, n)

    % Composite Trapezoidal Formula for Integration
    %
    % Solves int_a^b f(x) dx across n panels.
    %
    % Error : e <= (b-a) * h^2 / 12 f^(2)(xi)
    % Notes : Error will be zero if f in C^2[a, b].
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
    xi = 0;

    for i=1:n-1
        x = a+i*h;
        xi = xi + f(x);
    end

    v = h*(xi0 + 2*xi)/2;

end
