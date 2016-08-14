function [p] = newton(f, fp, p, iterations)

    for i=1:iterations

        p = p - f(p)/fp(p);

        fprintf('Iteration %3.0d: p = %4.9f, f(p) = %4.9f \n', i, p, f(p));

    end
end