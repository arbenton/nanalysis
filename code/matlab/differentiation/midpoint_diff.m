function [v] = midpoint_diff(f, p, h, points)

    % Midpoint Formulas for Differentiation
    %
    % Approximates f'(p), given f and p.
    %
    % Error : 3 Point : |e| <= h^2 / 6 f^(3) (xi)
    %         5 Point : |e| <= h^4 / 30 f^(5) (xi)
    % Notes : Prone to roundoff error, an optimal h != 0 exists
    %
    % Arguments:
    %   f : function
    %   p : x value to be approximated
    %   h : step size
    %   points : points to be used (3 or 5)
    % Returns:
    %   v : approximated value of f'(p)

    if ~exists('points', 'var')
        points = 5
    end

    if points == 3
        % 3 point midpoint formula
        v = (f(p+h)-f(p-h)) / (2*h);
    elseif points == 5
        % 5 point midpoint formula
        v = (f(p-2*h)-8*f(p-h)+8*f(p+h)-f(p+2*h)) / (12*h);
    else
        error('Only 3 and 5 point is supported.')
    end

end
