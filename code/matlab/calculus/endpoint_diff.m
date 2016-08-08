function [v] = endpoint_diff(x, y)

    h = mean(diff(x));

    if length(x) == 3
        c = [-3 4 -1];
        d = 2*h;
    elseif length(x) == 5
        c = [-25 48 -36 16 -3];
        d = 12*h;
    else
        error('Only 3 and 5 point is supported.')
    end

    v = (c * y') / d;

end
