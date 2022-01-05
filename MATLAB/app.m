data = dir('data');

% GETTING ALL THE X, Y, Z CO-ORDINATES FROM ALL FILES IN THREE ARRAYS

x_coordinates = [];
y_coordinates = [];
z_coordinates = [];
TECS = [];

for i = 1: length(data)
    file_name = strcat('data/', data(i).name);
    if (isfile(file_name))
        x_LEO = ncread(file_name, 'x_LEO');
        x_LEO = transpose(x_LEO);
        x_coordinates = [x_coordinates, x_LEO];
    end
end

for i = 1: length(data)
    file_name = strcat('data/', data(i).name);
    if (isfile(file_name))
        y_LEO = ncread(file_name, 'y_LEO');
        y_LEO = transpose(y_LEO);
        y_coordinates = [y_coordinates, y_LEO];
    end
end

for i = 1: length(data)
    file_name = strcat('data/', data(i).name);
    if (isfile(file_name))
        z_LEO = ncread(file_name, 'z_LEO');
        z_LEO = transpose(z_LEO);
        z_coordinates = [z_coordinates, z_LEO];
    end
end

for i = 1: length(data)
    file_name = strcat('data/', data(i).name);
    if (isfile(file_name))
        TEC = ncread(file_name, 'TEC');
        TEC = transpose(TEC);
        TECS = [TECS, TEC];
    end
end

% ============================================================================

% CONVERTING TO LATS AND LONGS 
lats = [];
longs = [];

for i = 1: length(x_coordinates)/4
    lla = ecef2lla([x_coordinates(i), y_coordinates(i), z_coordinates(i)]);
    lats = [lats, lla(1)];
    longs = [longs, lla(2)];
end