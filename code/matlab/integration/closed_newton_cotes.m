function [v] = closed_newton_cotes(f, a, b, n)

    % Closed Newton Cotes Formulas for Integration
    %
    % Solves int_a^b f(x) dx, inclusive of a and b.
    %
    % Error : n = 1: e <= h^3 / 12 f^(2)(xi)
    %         n = 2: e <= h^5 / 90 f^(4)(xi)
    %         n = 3: e <= 3*h^5 / 80 f^(4)(xi)
    %         n = 4: e <= 8*h^7 / 945 f^(6)(xi)
    %
    % Arguments:
    %   f : function
    %   a : lower bound
    %   b : upper bound
    %   n : number of panels
    % Returns:
    %   v : value of integral

    if ~exist('n', 'var')
        n = 4;
    end

    if n == 1
        % Trapezoidal Rule
        h = b - a;
        v = (h/2) * (f(a) + f(b));
    elseif n == 2
        % Simpsons Rule
        h = (b - a)/2;
        v = (h/3) * (f(a) + 4*f(a+h) + f(b));
    elseif n == 3
        % Simpson's Three-Eighths Rule
        h = (b - a)/3;
        v = (3*h/8) * (f(a) + 3*f(a+h) + 3*f(a+2*h) + f(b));
    elseif n == 4
        % Fourth Order
        h = (b - a)/4;
        v = (2*h/45) * (7*f(a) + 32*f(a+h) + 12*f(a+2*h) + 32*f(a+3*h) + 7*f(b));
    else
        error('Only formulas of order 1 to 4 are available.')
    end

end
