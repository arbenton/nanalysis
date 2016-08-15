function [v] = open_newton_cotes(f, a, b, n)

    % Open Newton Cotes Formulas for Integration
    %
    % Solves int_a^b f(x) dx, exclusive of a and b.
    %
    % Error : n = 0: e <= h^3 / 3 f^(2)(xi)
    %         n = 1: e <= 3*h^3 / 4 f^(2)(xi)
    %         n = 2: e <= 14*h^5 / 45 f^(4)(xi)
    %         n = 3: e <= 95*h^5 / 144 f^(4)(xi)
    %
    % Arguments:
    %   f : function
    %   a : lower bound
    %   b : upper bound
    %   n : number of panels
    % Returns:
    %   v : value of integral

    if ~exist('n', 'var')
        n = 3;
    end

    if n == 0
        % Midpoint Rule
        h = (b - a)/2;
        v = (2*h) * f(a+h);
    elseif n == 1
        % First Order
        h = (b - a)/3;
        v = (3*h/2) * (f(a+h) + f(a+2*h));
    elseif n == 2
        % Second Order
        h = (b - a)/4;
        v = (4*h/3) * (2*f(a+h) - f(a+2*h) + 2*f(a+3*h));
    elseif n == 3
        % Third Order
        h = (b - a)/5;
        v = (5*h/24) * (11*f(a+h) + f(a+2*h) + f(a+3*h) + 11*f(a+4*h));
    end

end
