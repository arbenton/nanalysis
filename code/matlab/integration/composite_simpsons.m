function [v] = composite_simpsons(f, a, b, n)
    
    h = (a-b)/n;
    xi0 = f(a) + f(b);
    xi1 = 0;
    xi2 = 0;

    for i=1:n-1
        x = a+i*h;
        if i%2 == 0
            xi2 = xi2 + f(x);
        else
            xi1 = xi2 + f(x);
        end
    end

    v = h*(xi0 + 2*xi2 + 4*xi1)/3;

end
