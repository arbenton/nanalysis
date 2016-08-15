function [p] = bisection(f, a, b, iterations)

    % Bisection Algorithm for Finding Roots
    %
    % Solves f(p) = 0, where a <= p <= b and f(a)*f(b) < 0
    %
    % Error:  |p_n - p| <= (b - a) / (2^n)
    % Notes: Will always converge, so long as f is continuous on [a, b]
    %
    % Arguments:
    %     f : function
    %     a : lower bound
    %     b : upper bound
    %     iterations : maximum iterations
    % Returns:
    %     p : value of root

    if nargout == 0
        verbose = true;
    else
        verbose = false;
    end

    fa = f(a);
    p = a;
    fp = fa;

    for i=1:iterations
        % set p to center of the interval
        p = (a + b) / 2.0;
        fp = f(p);

        % test location of root in the interval
        if fp*fa > 0
            a = p;
            fa = fp;
        else
            b = p;
        end

        if verbose
            fprintf('Iteration %3.0d: p = %4.9f, f(p) = %4.9f \n', i, p, f(p));
        end
    end

end
