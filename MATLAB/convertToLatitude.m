function [lat] = toLat(z)
    % r = radius of earth
    r = 6371000;
    lat = asin(z/r);
    % convert to degress
    lat = lat * (180/pi);
end

