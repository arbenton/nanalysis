function [S] = clamped_cubic_splines (x, y, yp)
    
    n = length(x)-1;
    m = n - 1;
    A = y;
    h = zeros(1, m+1);

    for i=1:n
        h(i) = x(i+1)-x(i);
    end
    
    alpha = zeros(1, n+1);
    alpha(1) = 3.0*(A(2)-A(1))/h(1)-3.0*yp(1);
    alpha(end) = 3.0*yp(2)-3.0*(A(n+1)-A(n))/h(n);

    for i=1:m
        alpha(i+1) = 3.0*(A(i+2)*h(i)-A(i+1)*(x(i+2)-x(i))+A(i)*h(i+1))/(h(i+1)*h(i));
    end

    l = zeros(1,n+1);
    mu = zeros(1,n+1);
    z = zeros(1,n+1);
    l(1) = 1;
    mu(1) = 0;
    z(1) = 0;
    
    for i=1:m
        l(i+1) = 2*(x(i+2)-x(i))-h(i)*mu(i);
        mu(i+1) = h(i+1)/l(i+1);
        z(i+1) = (alpha(i+1)-h(i)*z(i))/l(i+1);
    end

    l(n+1) = h(n)*(2-mu(n));
    z(n+1) = (alpha(n+1)-h(n)*z(n))/l(n+1);

    B = zeros(1,n+1);
    C = zeros(1,n+1);
    D = zeros(1,n+1);
    C(n+1) = z(n+1);
    
    for i = 1:n
        j = n-i;
        C(j+1) = z(j+1)-mu(j+1)*C(j+2);
        B(j+1) = (A(j+2)-A(j+1))/h(j+1)-h(j+1)*(C(j+2)+2.0*C(j+1))/3.0;
        D(j+1) = (C(j+2)-C(j+1))/(3.0*h(j+1));
    end

    S = [A; B; C; D]';
end
