function [v] = midpoint_diff(x, y)

    h = mean(diff(x));

    if length(x) == 3
        c = [1 0 -1];
        d = 2*h;
    elseif length(x) == 5
        c = [1 -8 8 -1];
        d = 12*h;
    else 
        error('Only 3 and 5 point algorithms are supported')
    end

    v = (c * y') / d;

end
