function [p] = fixed_point(f, p, iterations)

    % Fixed Point Algorithm for Finding Roots
    %
    % Solves f(p) = 0
    %
    % Error : |p_n - p_{n-1}| = |f(p_n) - p_{n-1}|
    % Notes : Converges so long as f is continuous and differentiable.
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

        p = p - f(p);

        if verbose
            fprintf('Iteration %3.0d: p = %4.9f, f(p) = %4.9f \n', i, p, f(p));
        end
    end
    
end
