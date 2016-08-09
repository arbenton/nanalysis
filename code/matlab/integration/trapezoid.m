function [v] = trapezoid(f, a, b)

    v = ((a-b)/2) * (f(a) + f(b));
    
end
