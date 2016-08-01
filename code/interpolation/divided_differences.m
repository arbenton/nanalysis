function [P] = divided_differences(x, y, p)

    n = length(x);
    D = zeros(n,n);
    D(:,1) = y;
    for j=2:n,
        for k=j:n,
            D(k,j) = (D(k,j-1)-D(k-1,j-1))/(x(k)-x(k-j+1));
        end
    end
    P = 0;
    for i=1:n
        P = P + D(i, i)*prod(p*ones(1, i) - x(1:i));
    end

end