function [v] = endpoint_diff(f, p, h, points)

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
