filename = 'podTec_C001.2014.120.00.01.0031.G28.01_2013.3520_nc';

x_LEO = ncread(filename, 'x_LEO');
y_LEO = ncread(filename, 'y_LEO');
z_LEO = ncread(filename, 'z_LEO');

latitudes = [];
longitudes = [];

% get latitudes
for i = 1: length(x_LEO)
    z = z_LEO(i);
    lat = toLat(z);
    latitudes = [latitudes, lat];
end

% get longitudes
for i = 1: length(x_LEO)
    x = x_LEO(i);
    y = y_LEO(i);
    lon = toLon(y, x);
    longitudes = [longitudes, lon];
end
