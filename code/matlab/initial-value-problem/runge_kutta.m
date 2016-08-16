function [v] = runge_kutta(f, a, b, alpha, n)

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
    %   v : value of integral

    h = (b - a) / n;
    t = a;
    w = alpha;
    K = zeros(4);

    for i=1:n
        K1 = h*f(t, w);
        K2 = h*f(t+h/2, w+K1/2);
        K3 = h*f(t+h/2, w+K2/2);
        K4 = h*f(t+h, w+K3);
        w = w + (K1 + 2*K2 + 2*K3 + K4)/6;
        t = a + i*h;
    end

end
