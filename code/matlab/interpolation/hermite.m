function [P, v] = hermite(x, y, yp, p)

    n = length(x);
    z = zeros(2*n,1);
    Q = zeros(2*n,2*n);

    for i=1:n
        z(2*i-1) = x(i);
        z(2*i) = x(i);
        Q(2*i-1,1) = y(i);
        Q(2*i,1) = y(i);
        Q(2*i,2) = yp(i);
        if i~=1
            Q(2*i-1,2) = (Q(2*i-1,1)-Q(2*i-2,1)) / (z(2*i-1)-z(2*i-2));
        end
    end
    
    for i=2:2*n-1
       for j=2:i
            Q(i+1,j+1) = (Q(i+1,j)-Q(i,j))/(z(i+1)-z(i-j+1));
        end
    end

    P = diag(Q);

    if exist('p', 'var')
        v = P(1);
        for i=1:2*n-1
            v = v + P(i+1)*prod(p*ones(i,1)-z(1:i));
        end
    end
end
