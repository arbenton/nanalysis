function [P] = neville(x, y, p)

    n = length(x);
    Q = zeros(n, n);
    Q(:,1) = y(:);
    
    for i=1:n-1
        for j=1:(n-i)
            Q(j,i+1) = ((p-x(j))*Q(j+1,i)+(x(j+i)-p)*Q(j,i))/(x(j+i)-x(j));
        end
    end

    P = Q(1, n);

end
