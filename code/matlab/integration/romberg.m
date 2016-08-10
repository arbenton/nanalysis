function [v] = romberg(f, a, b, n)

    h = b-a;
    R = zeros(n, n);
    R(1,1) = (h/2)*(f(a) + f(b));

    for i=2:n
        s = 0;
        for k=1:2.^(i-2)
            s = s + f(a + (k-.5)*h);
        end
        R(2,1) = 1/2 * (R(1,1) + h*s);
    
        for j=2:i
            R(2,j) = R(2,j-1) + (R(2,j-1)-R(1,j-1))/(4^(j-1)-1);
        end
        
        h = h/2;
        
        for j=2:i
            R(1,j) = R(2,j);
        end

    end

    v = R(n, n);

end
