LEO6 = dir("LEO6");

LEO6_TECS = [];
times = [];

for i = 1: length(LEO6)
    file_name = strcat('LEO6/', LEO6(i).name);
    if (isfile(file_name))
        disp(file_name);
        TEC = ncread(file_name, 'TEC');
        TEC = transpose(TEC);
        LEO6_TECS = [LEO6_TECS, TEC];
        
        time = ncread(file_name, 'time');
        time = transpose(time);
        times = [times, time];
    end
end

plot(times, LEO6_TECS);

title('LEO6 TEC');
xlabel('Time [sec]'); 
ylabel('TEC [El/m^2]'); 
