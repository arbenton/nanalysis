function [v] = midpoint_diff(f, p, h, points)

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
