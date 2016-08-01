function [p] = secant(f, p_0, p_1, iterations)

    % divide by zero errors are common in this process
    % that's a fault of the algorithm.

    for i=1:iterations

        % set p according to secant algorithm
        p = p_1 - f(p_1)*(p_1 - p_0)/(f(p_1) - f(p_0));

        % swap old variables
        p_0 = p_1;
        p_1 = p;

        fprintf('Iteration %3.0d: p = %4.9f, f(p) = %4.9f \n', i, p, f(p));

    end
end