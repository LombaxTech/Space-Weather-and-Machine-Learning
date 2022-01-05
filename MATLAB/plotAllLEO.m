data = dir('data');

x_coordinates = [];
y_coordinates = [];
z_coordinates = [];
times = []; 
lats = [];
longs = [];
TECS = [];
diffTECS = [];
numberOfLoops = 0;


for i = 1: length(data)
    file_name = strcat('data/', data(i).name);
    if (isfile(file_name))
        
        x_LEO = ncread(file_name, 'x_LEO');
        x_LEO = transpose(x_LEO);
        x_coordinates = [x_coordinates, x_LEO];
         
        y_LEO = ncread(file_name, 'y_LEO');
        y_LEO = transpose(y_LEO);
        y_coordinates = [y_coordinates, y_LEO];
        
        z_LEO = ncread(file_name, 'z_LEO');
        z_LEO = transpose(z_LEO);
        z_coordinates = [z_coordinates, z_LEO];
        
        time = ncread(file_name, 'time');
        time = transpose(time);
        times = [times, time];   
        
        TEC = ncread(file_name, 'TEC');
        TEC = transpose(TEC);
        TECS = [TECS, TEC];
        
        diffTEC = diff(TEC);
        diffTECS = [diffTECS, diffTEC];
        
        numberOfLoops = numberOfLoops + 1;
    end
end

% CONVERT X, Y, Z CO-ORDINATES TO LATITUDES, LONGITUDES
for i = 1: length(x_coordinates)
    lla = ecef2lla([x_coordinates(i), y_coordinates(i), z_coordinates(i)]);
    lats = [lats, lla(1)];
    longs = [longs, lla(2)];
end

geobubble(lats(numberOfLoops + 1:end), longs(numberOfLoops + 1:end), diffTECS);
% geobubble(lats(2:end), longs(2:end), diff(LEO1_TECS))


title('All LEO TEC');
xlabel('Time [sec]'); 
ylabel('TEC [El/m^2]');
