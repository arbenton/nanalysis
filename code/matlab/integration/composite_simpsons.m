function [v] = composite_simpsons(f, a, b, n)
    
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
