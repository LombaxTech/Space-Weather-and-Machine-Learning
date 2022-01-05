% Directory holding all the data for the LEO 1
LEO1 = dir("LEO1");

% Variables to hold the value of the TEC and Time
LEO1_TECS = [];
times = [];

% Getting the TEC and times from all the files
% Note the loop is going till 20 due to hardware speed restrictions 
% For the full set of data, replace 20 with length(LEO1)
for i = 1: 20
    file_name = strcat('LEO1/', LEO1(i).name);
    if (isfile(file_name))
        TEC = ncread(file_name, 'TEC');
        TEC = transpose(TEC);
        LEO1_TECS = [LEO1_TECS, TEC];
        
        time = ncread(file_name, 'time');
        time = transpose(time);
        times = [times, time];
    end
end

% Set times as x and TEC as y variables
x = times;
y = LEO1_TECS;

noOfX = length(x);
sumX = 0;
sumY = 0;
sumXY = 0;
sumXSquared = 0;


% Get values needed to calculate means
for i = 1: length(x)
    sumX = sumX + x(i);
end

for i = 1: length(x)
    sumY = sumY + y(i);
end

for i = 1: length(x)
    sumXY = sumXY + x(i)*y(i);
end

for i = 1: length(x)
    sumXSquared = sumXSquared + (x(i)^2);
end

% Get the means of x, y, xy, x^2 etc
meanX = sumX / noOfX;
meanY = sumY / noOfX; % since length of y is = length of x
meanXY = sumXY / noOfX;
meanXSquared = sumXSquared / noOfX;
squareOfXMean = meanX^2;

% Regression Line
% calculate slope m
m = (meanX * meanY - meanXY) / (squareOfXMean - meanXSquared);
% calculate slope b 
b = meanY - m * meanX;

% Line of best fit using regression
yRegression = m * x + b;

% Plot Graph
plot(x, yRegression);




