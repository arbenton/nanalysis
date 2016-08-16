function [w t] = runge_kutta(f, a, b, alpha, n)

    % Euler Formula for Initial Value Problems
    %
    % Solves df/dx = f(t, x) given a<=x<=b and f(a)=alpha.
    %
    % Error : |e_n| <= h*M_2 / (2*L) [e^{(x_n - x_0)L} - 1]
    %
    % Arguments:
    %   f : function
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

    for i=1:n
        K1 = h*f(t(i), w(i));
        K2 = h*f(t(i)+h/2, w(i)+K1/2);
        K3 = h*f(t(i)+h/2, w(i)+K2/2);
        K4 = h*f(t(i)+h, w(i)+K3);
        w(i+1) = w(i) + (K1 + 2*K2 + 2*K3 + K4)/6;
        t(i+1) = a + i*h;
    end

    if verbose
        fprintf('\nApproximation:\n\n');
        fprintf('_________t_________|________w(t)_______\n');
        fprintf('%.16f | %.16f \n', [t; w]);
    end

end
