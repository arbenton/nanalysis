function [w t] = adams_multistep(f, a, b, alpha, n)

    % Adams Multistep for Initial Value Problems
    %
    % Solves df/dx = f(t, x) given a<=x<=b and f(a)=alpha.
    %
    % Error : |e_n| <= h*M_2 / (2*L) [e^{(x_n - x_0)L} - 1]
    % Notes : Accurate with functions where f''(x) = 0.
    %
    % Arguments:
    %   f : function f(t, x)
    %   a : lower bound
    %   b : upper bound
    %   alpha : initial value
    %   n : number of panels
    % Returns:
    %   w : value of variable
    %   t : parametric variable

    if nargout == 0
        verbose = true;
    else
        verbose = false;
    end

    h = (b - a) / n;
    t = zeros(1, n);
    t(1) = a;
    w = zeros(1, n);
    w(1) = alpha;

    for i=2:4
        K1 = h*f(t(i), w(i));
        K2 = h*f(t(i)+h/2, w(i)+K1/2);
        K3 = h*f(t(i)+h/2, w(i)+K2/2);
        K4 = h*f(t(i)+h, w(i)+K3);
        w(i+1) = w(i) + (K1 + 2*K2 + 2*K3 + K4)/6;
        t(i+1) = a + i*h;
    end

    for i=5:n
        t(i) = a + i*h;
        w(i) = w(3) + h*(55*f(t(4), w(4))-59*f(t(3), w(3))+37*f(t(2), w(2)) -
            9*f(t(1), w(1))) / 24;
        w(i) = w(3) + h*(9*f(t(i), w(i))+19*f(t(3), w(3))-5*f(t(2), w(2)) +
            f(t(1), w(1))) / 24;
        for j=1:3
            t(j) = t(j+1);
            w(j) = w(j+1);
        end
        t(3) = t(i);
        w(3) = w(i);
    end

    if verbose
        fprintf('\nApproximation:\n\n');
        fprintf('_________t_________|________w(t)_______\n');
        fprintf('%.16f | %.16f \n', [t; w]);
    end

end
