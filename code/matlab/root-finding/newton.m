function [p] = newton(f, fp, p, iterations)

    % Newton Algorithm for Finding Roots
    %
    % Solves f(p) = 0, where f'(p) ~= 0
    %
    % Error : |p_n - p| = - f(p_n) / f'(p_n)
    % Notes : Converges quadratically given a sufficient first guess.
    %
    % Arguments:
    %   f : function
    %   fp : derivative of function f
    %   p : guess of root
    %   iterations : maximum iterations
    % Returns:
    %   p : value of root

    if nargout == 0
        verbose = true;
    else
        verbose = false;
    end

    for i=1:iterations

        p = p - f(p)/fp(p);

        if verbose
            fprintf('Iteration %3.0d: p = %4.9f, f(p) = %4.9f \n', i, p, f(p));
        end
    end

end
