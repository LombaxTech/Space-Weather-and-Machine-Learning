tic;

LEO1 = dir("LEO1");

LEO1_TECS = [];
times = [];
x_coordinates = [];
y_coordinates = [];
z_coordinates = [];
lats = [];
longs = [];
diffTECS = [];
numberOfLoops = 0;


for i = 1: length(LEO1)/2
% for i = 1: 20
    file_name = strcat('LEO1/', LEO1(i).name);
    if (isfile(file_name))
%         disp(file_name);
        TEC = ncread(file_name, 'TEC');
        TEC = transpose(TEC);
        LEO1_TECS = [LEO1_TECS, TEC];
        
        time = ncread(file_name, 'time');
        time = transpose(time);
        times = [times, time];
        
%         GET THE X, Y, Z CO ORDINATES
        x_LEO = ncread(file_name, 'x_LEO');
        x_LEO = transpose(x_LEO);
        x_coordinates = [x_coordinates, x_LEO];
        
        y_LEO = ncread(file_name, 'y_LEO');
        y_LEO = transpose(y_LEO);
        y_coordinates = [y_coordinates, y_LEO];
        
        
        z_LEO = ncread(file_name, 'z_LEO');
        z_LEO = transpose(z_LEO);
        z_coordinates = [z_coordinates, z_LEO];
        
%         for i = 1: length(x_coordinates)
%             lla = ecef2lla([x_coordinates(i), y_coordinates(i), z_coordinates(i)]);
%             lats = [lats, lla(1)];
%             longs = [longs, lla(2)];
%         end

%         GEOBUBBLE FOR EACH FILE W DIFF(TEC), HOLD ON; CREATE FIGURE
%         BEFORE LOOP, FIGURE(1); GEOBUBBLE(..); HOLD ON; 

% DO IT FOR DIFFERENT DAYS 
% DO IT FOR ALL LEOS

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

% diffTECS

% plot(times(2:end), diff(LEO1_TECS));
% plot(times, diff(LEO1_TECS));

% geobubble(lats, longs, LEO1_TECS);
% geobubble(lats(2:end), longs(2:end), diff(LEO1_TECS))


% geobubble(lats(numberOfLoops + 1:end), longs(numberOfLoops + 1:end), diffTECS);
% plot(times(2:end), diff(LEO1_TECS));
plot3(lats, longs, LEO1_TECS);

% plot(times, LEO1_TECS);
% 
% title('Diff LEO1 TEC');
% xlabel('Time [sec]'); 
% ylabel('TEC [El/m^2]');


title('LEO1 TEC');
xlabel('Latitude'); 
ylabel('Longitude');
zlabel('LEO1 TEC');


toc;