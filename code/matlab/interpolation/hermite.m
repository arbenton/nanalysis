function [v] = hermite(x, y, yp, p)

    % Hermite Polynomials for Interpolation
    %
    % Approximates f(p), given x, y, and f'(x) for a given p using
    %   recursively constructed Hermite interpolants.
    %
    % Error : e_n <= f^(2n+2)(xi)/(2n+2)! prod_{i=0}^n (x-x_i)^2
    % Notes : Hermite polynomials match on derivatives also.
    %
    % Arguments:
    %   x : x values given
    %   y : f(x) values given
    %   yp : f'(x) values given
    %   p : x value to be approximated
    % Returns:
    %   v : approximated values of f(p)

    if nargout == 0
        verbose = true;
    else
        verbose = false;
    end

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

    v = P(1);
    for i=1:2*n-1
        v = v + P(i+1)*prod(p*ones(i,1)-z(1:i));
    end

    if verbose
        fprintf('Q Table:\n\n');
        disp(Q);
        if exist('v', 'var')
            fprintf('\nApproximation:\n\n');
            fprintf('_________p_________|________f(p)________\n');
            fprintf('%.16f | %.16f \n\n', [p; v]);
        end
    end

end
