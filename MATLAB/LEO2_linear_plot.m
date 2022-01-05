LEO2 = dir("LEO2");

LEO2_TECS = [];
times = [];

for i = 1: length(LEO2)
    file_name = strcat('LEO2/', LEO2(i).name);
    if (isfile(file_name))
        disp(file_name);
        TEC = ncread(file_name, 'TEC');
        TEC = transpose(TEC);
        LEO2_TECS = [LEO2_TECS, TEC];
        
        time = ncread(file_name, 'time');
        time = transpose(time);
        times = [times, time];
    end
end

plot(times, LEO2_TECS);


title('LEO6 TEC');
xlabel('Time [sec]'); 
ylabel('TEC [El/m^2]');