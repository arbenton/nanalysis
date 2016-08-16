function [v] = euler(f, a, b, alpha, n)

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

    for i=1:n
        w = w + h*f(t, w);
        t = a + i*h;
    end

end
