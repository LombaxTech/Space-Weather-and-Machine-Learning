LEO5 = dir("LEO5");

LEO5_TECS = [];
times = [];

for i = 1: length(LEO5)
    file_name = strcat('LEO5/', LEO5(i).name);
    if (isfile(file_name))
        disp(file_name);
        TEC = ncread(file_name, 'TEC');
        TEC = transpose(TEC);
        LEO5_TECS = [LEO5_TECS, TEC];
        
        time = ncread(file_name, 'time');
        time = transpose(time);
        times = [times, time];
    end
end

plot(times, LEO5_TECS);

title('LEO6 TEC');
xlabel('Time [sec]'); 
ylabel('TEC [El/m^2]');