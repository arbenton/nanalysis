function [v] = open_newton_cotes(f, a, b, n)

        if ~exists('n', 'var')
            n = 3;
        end

        if n == 0
            % Midpoint Rule
            h = (a - b)/2;
            v = (2*h) * f(a+h);
        elseif n == 1
            % First Order
            h = (a - b)/3;
            v = (3*h/2) * (f(a+h) + f(a+2*h));
        elseif n == 2
            % Second Order
            h = (a - b)/4;
            v = (4*h/3) * (2*f(a+h) - f(a+2*h) + 2*f(a+3*h));
        elseif n == 3
            % Third Order
            h = (a - b)/5;
            v = (5*h/24) * (11*f(a+h) + f(a+2*h) + f(a+3*h) + 11*f(a+4*h));
        end

end
