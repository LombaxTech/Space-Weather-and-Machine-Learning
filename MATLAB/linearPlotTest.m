LEO1 = dir("LEO1");
LEO2 = dir("LEO2");

LEO1_TECS = [];
LEO2_TECS = [];

times_leo1 = [];
times_leo2 = [];


for i = 1: length(LEO1)
    file_name = strcat('LEO1/', LEO1(i).name);
    if (isfile(file_name))
        disp(file_name);
        TEC = ncread(file_name, 'TEC');
        TEC = transpose(TEC);
        LEO1_TECS = [LEO1_TECS, TEC];
        
        time = ncread(file_name, 'time');
        time = transpose(time);
        times_leo1 = [times_leo1, time];
    end
end

for i = 1: length(LEO2)
    file_name = strcat('LEO2/', LEO2(i).name);
    if (isfile(file_name))
        TEC = ncread(file_name, 'TEC');
        TEC = transpose(TEC);
        LEO2_TECS = [LEO2_TECS, TEC];
        
        time = ncread(file_name, 'time');
        time = transpose(time);
        times_leo2 = [times_leo2, time];
    end
end


plot(times_leo1, LEO1_TECS);
hold on;
plot(times_leo2, LEO2_TECS);

% add labels and other LEOS

% diff function matlab for detlta tec
% Delta TEC code below
figure;
plot(times_leo1(2: end), diff(LEO1_TECS));
hold on;
plot(times_leo2(2: end), diff(LEO2_TECS));

% ML model training + tests ... 





