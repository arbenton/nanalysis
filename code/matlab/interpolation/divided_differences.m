function [v] = divided_differences(x, y, p)

    % Divided Differences Algorithm for Interpolation
    %
    % Approximates f(p), given x and y for a given p using
    %   recursively constructed Newton interpolants.
    %
    % Error : |f(x) - P(x)| <= f[x_0,...x_n] prod_{i=0}^n (x-x_i)
    % Notes :
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

    if verbose
        fprintf('D Table:\n\n');
        disp(D);
        if exist('v', 'var')
            fprintf('\nApproximation:\n\n');
            fprintf('_________p_________|________f(p)________\n');
            fprintf('%.16f | %.16f \n\n', [p; v]);
        end
    end

end
