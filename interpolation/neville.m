function [v] = neville(x, y, p)

    % Neville Algorithm for Interpolation
    %
    % Approximates f(p), given x and y for a given p using
    %   recursively constructed Lagrange interpolants.
    %
    % Error : |f(x) - P(x)| <= [f^{(n+1)}(xi(x))/(n+1)!] * prod_{i=1}^n (x-x_i)
    % Notes : Less prone to roundoff error than vanilla lagrange.
    %
    % Arguments:
    %   x : x values given
    %   y : f(x) values given
    %   p : x value to be approximated
    % Returns:
    %   v : approximated values of f(p)

    if nargout == 0
        verbose = true;
    else
        verbose = false;
    end

    n = length(x);
    Q = zeros(n, n, length(p));
    Q(:,1) = y(:);

    for i=1:n-1
        for j=1:(n-i)
            Q(j,i+1) = ((p-x(j))*Q(j+1,i)+(x(j+i)-p)*Q(j,i))/(x(j+i)-x(j));
        end
    end

    v = Q(1, n);

    if verbose
        fprintf('Q Table:\n\n');
        disp(Q);
        fprintf('Approximation:\n\n');
        fprintf('_________p_________|________f(p)________\n');
        fprintf('%.16f | %.16f \n\n', [p; v]);
    end

end
