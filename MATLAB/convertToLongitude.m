function [lon] = toLon(y, x)
    lon = atan2(y, x);
    lon = lon * (180/pi);
end

