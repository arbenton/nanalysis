function [p] = bisection(f, a, b, iterations)

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

        fprintf('Iteration %3.0d: p = %4.9f, f(p) = %4.9f \n', i, p, f(p));

    end
end