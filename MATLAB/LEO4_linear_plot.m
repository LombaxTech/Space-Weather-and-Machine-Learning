LEO4 = dir("LEO4");

LEO4_TECS = [];
times = [];

for i = 1: length(LEO4)
    file_name = strcat('LEO4/', LEO4(i).name);
    if (isfile(file_name))
        disp(file_name);
        TEC = ncread(file_name, 'TEC');
        TEC = transpose(TEC);
        LEO4_TECS = [LEO4_TECS, TEC];
        
        time = ncread(file_name, 'time');
        time = transpose(time);
        times = [times, time];
    end
end

plot(times, LEO4_TECS);


title('LEO6 TEC');
xlabel('Time [sec]'); 
ylabel('TEC [El/m^2]');