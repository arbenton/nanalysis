function [v] = simpsons(f, a, b)

    v = ((a - b)/3) * (f(a) + 4*f((a-b)/2) + f(b));

end
