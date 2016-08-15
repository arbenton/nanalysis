function [v] = composite_trapezoidal(f, a, b, n)
    
    h = (b - a)/n;
    xi0 = f(a) + f(b);
    xi = 0;

    for i=1:n-1
        x = a+i*h;
        xi = xi + f(x);
    end

    v = h*(xi0 + 2*xi)/2;

end
