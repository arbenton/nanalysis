function [v] = endpoint_diff(f, p, h, points)

    % Endpoint Formulas for Differentiation
    %
    % Approximates f'(p), given f and p.
    %
    % Error : 3 Point : |f'(x) - f'(x)| <= h^2 / 3 f^(3) (xi)
    %         5 Point : |f'(x) - f'(x)| <= h^4 / 5 f^(5) (xi)
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
        % 3 point endpoint formula
        v = (-3*f(p)+4*f(p+h)-1*f(p+2*h)) / (2*h);
    elseif points == 5
        % 5 point endpoint formula
        v = (-25*f(p)+48*f(p+h)-36*f(p+2*h)+16*f(p+3*h)-3*f(p+4*h)) / (12*h);
    else
        error('Only 3 and 5 point is supported.')
    end

end
