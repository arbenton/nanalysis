function [v] = lagrange(x, y, p)

    % Lagrange Polynomial for Interpolation
    %
    % Approximates f(p), given x and y for a given p using
    %   Lagrange interpolants L.
    %
    % Error : |f(x) - P(x)| <= [f^{(n+1)}(xi(x))/(n+1)!] * prod_{i=1}^n (x-x_i)
    % Notes : Prone to roundoff error
    %
    % Arguments:
    %   x : x values given
    %   y : f(x) values given
    %   p : x values to be approximated
    % Returns:
    %   v : approximated values of f(p)

    if nargout == 0
        verbose = true;
    else
        verbose = false;
    end

    n = length(y);
    v = zeros(1, length(p));

    for k=1:n
        L = ones(1, length(p));
        for j=[1:k-1 k+1:n]
            L = L .* ((p - x(j)) ./ (x(k) - x(j)));
        end
        v = v + L.*y(k);
    end

    if verbose
        fprintf('Approximation:\n\n')
        fprintf('_________p_________|________f(p)________\n')
        fprintf('%.16f | %.16f \n\n', [p; v]);
    end

end
