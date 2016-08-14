function [P] = lagrange(x, y, p)

    n = length(y);
    P = zeros(1, length(p));

    for k=1:n
        L = ones(1, length(p));
        for j=[1:k-1 k+1:n]
            L = L .* ((p - x(j)) ./ (x(k) - x(j)));
        end
        P = P + L.*y(k);
    end

    fprintf('Point %.2f, Value %.8f \n', [p; P]);

end 
