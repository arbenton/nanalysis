function [P, v] = divided_differences(x, y, p)

    n = length(x);
    D = zeros(n,n);
    D(:,1) = y;
    for j=2:n,
        for k=j:n,
            D(k,j) = (D(k,j-1)-D(k-1,j-1))/(x(k)-x(k-j+1));
        end
    end

    P = diag(D);

    if exist('p', 'var')
        v = P(1);
        for i=1:n-1
            v = v + P(i+1)*prod(p*ones(1,i)-x(1:i));
        end
    end
end
