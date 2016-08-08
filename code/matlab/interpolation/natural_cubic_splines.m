function [S] = natural_cubic_splines (x, y, p)
    
    n = length(x)-1;
    m = n - 1;
    A = y;
    h = zeros(1, n);
    alpha = h;

    for i=1:n
        h(i) = x(i+1)-x(i);
    end
    
    for i=1:m
        alpha(i+1) = 3.0*(A(i+2)*h(i)-A(i+1)*(x(i+2)-x(i))+A(i)*h(i+1))/(h(i+1)*h(i));
    end

    l = zeros(1,n+1);
    mu = l;
    z = l;
    l(1) = 1;
    mu(1) = 0;
    z(1) = 0;
    
    for i=1:m
        l(i+1) = 2*(x(i+2)-x(i))-h(i)*mu(i);
        mu(i+1) = h(i+1)/l(i+1);
        z(i+1) = (alpha(i+1)-h(i)*z(i))/l(i+1);
    end

    l(end) = 1;
    z(end) = 0;

    B = zeros(1,n+1);
    C = zeros(1,n+1);
    D = zeros(1,n+1);
    C(end) = z(end);
    
    for i = 0:m
        j = m-i;
        C(j+1) = z(j+1)-mu(j+1)*C(j+2);
        B(j+1) = (A(j+2)-A(j+1))/h(j+1)-h(j+1)*(C(j+2)+2.0*C(j+1))/3.0;
        D(j+1) = (C(j+2)-C(j+1))/(3.0*h(j+1));
    end

    S = [A; B; C; D]';
end
