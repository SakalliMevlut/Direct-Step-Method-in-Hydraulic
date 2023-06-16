clear
close all
clc
format short g
promptMessage = sprintf('Which Channel Geometry Type was Used?');
titleBarCaption = 'Trapezoidal or Rectangular ';
numberOfUsers = 1;
buttonSelections = zeros(1, numberOfUsers); % Preallocate.
userNumber = 1; 
button = questdlg(promptMessage, titleBarCaption, 'Trapezoidal', 'Rectangular', 'Trapezoidal');
if strcmpi(button, 'Trapezoidal')
    Channel_Type = 1;
else
    Channel_Type = 2;
end
%g = input('g = ');
promptMessage = sprintf('What Unit System is Used?');
titleBarCaption = 'US or SI ';
numberOfUsers = 1;
buttonSelections2 = zeros(1, numberOfUsers); % Preallocate.
userNumber2 = 1; 
button = questdlg(promptMessage, titleBarCaption, 'US', 'SI', 'US');
if strcmpi(button, 'SI')
  g = 9.81;
  fprintf('g = %.2f m/s^2\n',g);
  fprintf('Unit System : SI Unit System(m^3/s - m).\n');
else 
g = 32.2;
fprintf('g = %.2f ft/s^2\n',g);
fprintf('Unit System : US Unit System(ft^3/s - ft).\n');
end
promptMessage = sprintf('Is Channel Elevation known?');
titleBarCaption = 'Yes or No ';
numberOfUsers = 1;
buttonSelections4 = zeros(1, numberOfUsers); % Preallocate.
userNumber4 = 1; 
button4 = questdlg(promptMessage, titleBarCaption, 'Yes', 'No', 'Yes');
if strcmpi(button4, 'Yes')
prompt = {'Enter Channel Elevation:'};
dlgtitle = 'Input';
elev = str2double(inputdlg(prompt,dlgtitle));
elev1 = 1;
else
elev1 = 0;    
end
if Channel_Type == 1
if g == 9.81
Trapezoidal = imread('trapezoidal.jpg');
imshow(Trapezoidal)
Trapezoidal = title('Trapezoidal Channel','Color','blue');
prompt = {'Q(m^3/s):','b(m):','H(Channel side slope):','V:'};
dlgtitle = 'Input';
given_data_Q = str2double(inputdlg(prompt(1,1),dlgtitle));
given_data_b = str2double(inputdlg(prompt(1,2),dlgtitle));
given_data_m = str2double(inputdlg(prompt(1,3),dlgtitle));
given_data_l = str2double(inputdlg(prompt(1,4),dlgtitle));
close Figure 1
else
Trapezoidal = imread('trapezoidal.jpg');
imshow(Trapezoidal)
Trapezoidal = title('Trapezoidal Channel','Color','blue');
prompt1 = {'Q(ft^3/s):','b(ft):','H(Channel side slope):','V:'};
dlgtitle = 'Input';
given_data_Q = str2double(inputdlg(prompt1(1,1),dlgtitle));
given_data_b = str2double(inputdlg(prompt1(1,2),dlgtitle));
given_data_m = str2double(inputdlg(prompt1(1,3),dlgtitle));
given_data_l = str2double(inputdlg(prompt1(1,4),dlgtitle));
close Figure 1
end
prompt3 = {'n:'};
dlgtitle = 'Input';
given_data_n = str2double(inputdlg(prompt3,dlgtitle));
Slope1 = imread('slope_of_channel.jpeg');
imshow(Slope1)
Slope1 = title('Slope Equation','Color','blue');
promptMessage = sprintf('Is S0 value known?');
titleBarCaption = 'Yes or No';
numberOfUsers1 = 1;
buttonSelections1 = zeros(1, numberOfUsers); % Preallocate.
userNumber1 = 1; 
button = questdlg(promptMessage, titleBarCaption, 'Yes', 'No', 'Yes');
if strcmpi(button, 'Yes')
prompt4 = {'S0:'};
dlgtitle = 'Input';
given_data_S0 = str2double(inputdlg(prompt4,dlgtitle));
else
prompt5 = {'X:','Z:'};
dlgtitle = 'Input';
given_data_X = str2double(inputdlg(prompt5(1,1),dlgtitle));
given_data_Z = str2double(inputdlg(prompt5(1,2),dlgtitle));
given_data_S0 = given_data_Z/given_data_X;
close Figure 1
%fprintf('S0 = %f\n',given_data_S0);
end
else
if g == 9.81
Rectangular = imread('rechteck.jpg');
imshow(Rectangular)
Rectangular = title('Rectangular Channel','Color','blue');
prompt6 = {'Q(m^3/s):','b(m):'};
dlgtitle = 'Input';
given_data_Q = str2double(inputdlg(prompt6(1,1),dlgtitle));
given_data_b = str2double(inputdlg(prompt6(1,2),dlgtitle));
close Figure 1
else
Rectangular = imread('rechteck.jpg');
imshow(Rectangular)
Rectangular = title('Rectangular Channel','Color','blue');
prompt7 = {'Q(ft^3/s):','b(ft):'};
dlgtitle = 'Input';
given_data_Q = str2double(inputdlg(prompt7(1,1),dlgtitle));
given_data_b = str2double(inputdlg(prompt7(1,2),dlgtitle));
close Figure 1
end
prompt8 = {'n:'};
dlgtitle = 'Input';
given_data_n = str2double(inputdlg(prompt8,dlgtitle));
Slope2 = imread('slope_of_channel.jpeg');
imshow(Slope2)
Slope2 = title('Slope Equation','Color','blue');
promptMessage = sprintf('Is S0 value known?');
titleBarCaption = 'Yes or No';
numberOfUsers2 = 1;
buttonSelections2 = zeros(1, numberOfUsers); % Preallocate.
userNumber2 = 1; 
button = questdlg(promptMessage, titleBarCaption, 'Yes', 'No', 'Yes');
if strcmpi(button, 'Yes')
prompt9 = {'S0:'};
dlgtitle = 'Input';
given_data_S0 = str2double(inputdlg(prompt9,dlgtitle));
close Figure 1
else
prompt10 = {'X:','Z:'};
dlgtitle = 'Input';
given_data_X = str2double(inputdlg(prompt10(1,1),dlgtitle));
given_data_Z = str2double(inputdlg(prompt10(1,2),dlgtitle));
given_data_S0 = given_data_Z/given_data_X;
close Figure 1
end    
end
if Channel_Type == 2 && g == 9.81 %(Rectangular,SI Unit)
    syms yn
yn=vpasolve(given_data_Q==((yn*given_data_b)/given_data_n)*(yn*given_data_b/(given_data_b+2*yn))...
    ^(2/3)*(given_data_S0)^(1/2));
elseif Channel_Type == 1 && g == 9.81 %(Trapez,SI Unit)
    syms yn
X = vpasolve(given_data_Q==((given_data_b*yn+given_data_m*yn^2)^(5/3))*sqrt(given_data_S0)...
    /(given_data_n*((given_data_b+2*yn*sqrt(1+given_data_m^2)))^(2/3)),yn);
assume(yn,'real');
yn = vpasolve(given_data_Q==((given_data_b*yn+given_data_m*yn^2)^(5/3))*sqrt(given_data_S0)...
    /(given_data_n*((given_data_b+2*yn*sqrt(1+given_data_m^2)))^(2/3)),[-Inf Inf] );
elseif Channel_Type == 2 && g == 32.2 %(Rectangular,US Unit)
    syms yn
    yn=vpasolve(given_data_Q==1.49*((yn*given_data_b)/given_data_n)*(yn*given_data_b/(given_data_b+2*yn))...
    ^(2/3)*(given_data_S0)^(1/2));
elseif Channel_Type == 1 && g == 32.2 %(Trapez,US Unit)
    syms yn
X = vpasolve(given_data_Q==1.49*((given_data_b*yn+given_data_m*yn^2)^(5/3))*sqrt(given_data_S0)...
    /(given_data_n*((given_data_b+2*yn*sqrt(1+given_data_m^2)))^(2/3)),yn);
assume(yn,'real');
yn = vpasolve(given_data_Q==1.49*((given_data_b*yn+given_data_m*yn^2)^(5/3))*sqrt(given_data_S0)...
    /(given_data_n*((given_data_b+2*yn*sqrt(1+given_data_m^2)))^(2/3)),[-Inf Inf] );
end
if Channel_Type == 2
    syms yc
    yc=((((given_data_Q/given_data_b)^2)/g)^(1/3));
else 
    syms yc
yc=vpasolve(1==(given_data_Q/(given_data_b*yc+2*yc^2))/((g*(given_data_b*yc+2*yc^2)/...
    (given_data_b+4*yc))^0.5));
end
if g == 9.81
fprintf('Normal Depth(m): %f\n',yn);
fprintf('Critical Depth(m): %f\n',yc);    
else
fprintf('Normal Depth(ft): %f\n',yn);
fprintf('Critical Depth(ft): %f\n',yc);    
end
promptMessage = sprintf('What is the first value in the solution range?');
titleBarCaption = 'Range';
numberOfUsers = 1;
buttonSelections9 = zeros(1, numberOfUsers); 
userNumber9 = 1; 
button9 = questdlg(promptMessage, titleBarCaption, 'y1', 'yn', 'yc','y1');
if strcmpi(button9, 'y1')
prompt11 = {'y1:'};
dlgtitle = 'Input';
given_data_y1 = str2double(inputdlg(prompt11(1,1),dlgtitle));
y1 = given_data_y1;
elseif strcmpi(button9, 'yn')
given_data_y1 = 0;
y1 = yn;
elseif strcmpi(button9, 'yc')
given_data_y1 = 0;
y1 = yc;
end
promptMessage = sprintf('What is the second value in the solution range?');
titleBarCaption = 'Range';
numberOfUsers = 1;
buttonSelections10 = zeros(1, numberOfUsers); 
userNumber10 = 1; 
button10 = questdlg(promptMessage, titleBarCaption, 'y2', 'yn', 'yc','y2');
if strcmpi(button10, 'y2')
prompt12 = {'y2:'};
dlgtitle = 'Input';
given_data_y2 = str2double(inputdlg(prompt12(1,1),dlgtitle));
y2 = given_data_y2;
elseif strcmpi(button10, 'yn')
given_data_y2 = 0;
y2 = yn;
elseif strcmpi(button10, 'yc')
given_data_y2 = 0;
y2 = yc;
end
if yc > yn
Steep_Slope = imread('Steep_Slope.jpg');
imshow(Steep_Slope)
Steep_Slope = title('Steep Slope Profile','Color','blue');
fprintf('Slope Type: Steep Slope.\n');
Typ_of_Slp = 1;
else
    fprintf('Slope Type: Mild Slope.\n');
    Typ_of_Slp = 2;
    Mild_Slope = imread('Mild_Slope.jpg');
    imshow(Mild_Slope)
    Mild_Slope = title('Mild Slope Profile','Color','blue');
end
if Typ_of_Slp == 2 && given_data_y1 > 0 && given_data_y2 == 0
    if given_data_y1 > yc && given_data_y1 > yn 
        fprintf('Slope Profile : M1.\n');
        profile = 1;
        fprintf('Flow : Subcritical Flow.\n')
        flow = 1;
        fprintf('Control : Downstream to Upstream.\n');
    elseif given_data_y1 > yc && given_data_y1 < yn
        fprintf('Slope Profile : M2.\n');
        profile = 2;
        fprintf('Flow : Subcritical Flow.\n')
        flow = 1;
        fprintf('Control : Downstream to Upstream.\n');
    elseif given_data_y1 < yc && given_data_y1 < yn
        fprintf('Slope Profile : M3.\n');
        profile = 2;
        fprintf('Flow : Supercritical Flow.\n');
        flow = 2;
        fprintf('Control : Upstream to Downstream.\n');
    end
elseif Typ_of_Slp == 2 && given_data_y1 == 0 && given_data_y2 == 0    
    fprintf('Slope Profile : M2.\n');
    profile = 2;
    fprintf('Flow : Subcritical Flow.\n')
    flow = 1;
    fprintf('Control : Downstream to Upstream.\n');
elseif Typ_of_Slp == 2 && given_data_y1 == 0 && given_data_y2 > 0
    if given_data_y2 > yc && given_data_y2 > yn 
        fprintf('Slope Profile : M1.\n');
        profile = 1;
        fprintf('Flow : Subcritical Flow.\n')
        flow = 1;
        fprintf('Control : Downstream to Upstream.\n');
    elseif given_data_y2 > yc && given_data_y2 < yn
        fprintf('Slope Profile : M2.\n');
        profile = 2;
        fprintf('Flow : Subcritical Flow.\n')
        flow = 1;
        fprintf('Control : Downstream to Upstream.\n');
    elseif given_data_y2 < yc && given_data_y2 < yn
        fprintf('Slope Profile : M3.\n');
        profile = 2;
        fprintf('Flow : Supercritical Flow.\n');
        flow = 2;
        fprintf('Control : Upstream to Downstream.\n');
    end
elseif Typ_of_Slp == 2 && given_data_y1 > 0 && given_data_y2 > 0 
    if given_data_y1 > yc && given_data_y2 > yc && given_data_y1 > yn && given_data_y2 > yn
     fprintf('Slope Profile : M1.\n');
        profile = 1;
        fprintf('Flow : Subcritical Flow.\n')
        flow = 1;
        fprintf('Control : Downstream to Upstream.\n');
    elseif given_data_y1 > yc && given_data_y2 > yc && given_data_y1 < yn && given_data_y2 < yn
    fprintf('Slope Profile : M2.\n');
    profile = 2;
    fprintf('Flow : Subcritical Flow.\n')
    flow = 1;
    fprintf('Control : Downstream to Upstream.\n');
    elseif given_data_y1 < yc && given_data_y2 < yc && given_data_y1 < yn && given_data_y2 < yn
    fprintf('Slope Profile : M3.\n');
    profile = 2;
    fprintf('Flow : Supercritical Flow.\n');
    flow = 2;
    fprintf('Control : Upstream to Downstream.\n');
    end
elseif Typ_of_Slp == 1 && given_data_y1 == 0 && given_data_y2 == 0
    fprintf('Slope Profile : S2.\n');
    profile = 1;
    fprintf('Flow : Supercritical Flow.\n')
    flow = 2;
    fprintf('Control : Upstream to Downstream.\n');    
elseif Typ_of_Slp == 1 && given_data_y1 > 0 && given_data_y2 == 0
    if given_data_y1 > yc && given_data_y1 > yn 
        fprintf('Slope Profile : S1.\n');
        profile = 1;
        fprintf('Flow : Subcritical Flow.\n')
        flow = 1;
        fprintf('Control : Downstream to Upstream.\n');
    elseif given_data_y1 > yn && given_data_y1 < yc
        fprintf('Slope Profile : S2.\n');
        profile = 1;
        fprintf('Flow : Supercritical Flow.\n')
        flow = 2;
        fprintf('Control : Upstream to Downstream.\n');
    elseif given_data_y1 < yc && given_data_y1 < yn
        fprintf('Slope Profile : S3.\n');
        profile = 2;
        fprintf('Flow : Supercritical Flow.\n');
        flow = 2;
        fprintf('Control : Upstream to Downstream.\n');
    end    
elseif Typ_of_Slp == 1 && given_data_y1 == 0 && given_data_y2 > 0
    if given_data_y2 > yc && given_data_y2 > yn 
        fprintf('Slope Profile : S1.\n');
        profile = 1;
        fprintf('Flow : Subcritical Flow.\n')
        flow = 1;
        fprintf('Control : Downstream to Upstream.\n');
    elseif given_data_y2 > yn && given_data_y2 < yc
        fprintf('Slope Profile : S2.\n');
        profile = 1;
        fprintf('Flow : Supercritical Flow.\n')
        flow = 2;
        fprintf('Control : Upstream to Downstream.\n');
    elseif given_data_y2 < yc && given_data_y2 < yn
        fprintf('Slope Profile : S3.\n');
        profile = 2;
        fprintf('Flow : Supercritical Flow.\n');
        flow = 2;
        fprintf('Control : Upstream to Downstream.\n');
    end
elseif Typ_of_Slp == 1 && given_data_y1 > 0 && given_data_y2 > 0
    if given_data_y1 > yc && given_data_y2 > yc && given_data_y1 > yn && given_data_y2 > yn
    fprintf('Slope Profile : S1.\n');
        profile = 1;
        fprintf('Flow : Subcritical Flow.\n')
        flow = 1;
        fprintf('Control : Downstream to Upstream.\n');
    elseif given_data_y1 > yn && given_data_y2 > yn && given_data_y1 < yc && given_data_y2 < yc
    fprintf('Slope Profile : S2.\n');
        profile = 1;
        fprintf('Flow : Supercritical Flow.\n')
        flow = 2;
        fprintf('Control : Upstream to Downstream.\n');
    elseif given_data_y1 < yc && given_data_y2 < yc && given_data_y1 < yn && given_data_y2 < yn
    fprintf('Slope Profile : S3.\n');
        profile = 2;
        fprintf('Flow : Supercritical Flow.\n');
        flow = 2;
        fprintf('Control : Upstream to Downstream.\n');
    end
end
promptMessage = sprintf('Is the stepsize known?');
titleBarCaption = 'Stepsize';
numberOfUsers = 1;
buttonSelections5 = zeros(1, numberOfUsers); % Preallocate.
userNumber5 = 1; 
button5 = questdlg(promptMessage, titleBarCaption, 'Yes', 'No', 'Yes');
if strcmpi(button5, 'Yes')
prompt13 = {'Stepsize coefficient:'};
dlgtitle = 'Input';
s_coef = str2double(inputdlg(prompt13,dlgtitle));
else
s_coef = 0.5;    
end
if y1 > y2 
stepnum=ceil(double((y1-y2)/s_coef));
stepsize = double(y1-y2)/stepnum;
else
stepnum=ceil(double((y2-y1)/s_coef));
stepsize = double(y2-y1)/stepnum;    
end
y = zeros(stepnum+1,1);
sumE = zeros(stepnum+1,1);
Avg_Sf = zeros(stepnum+1,1);
S0_AvgSf = zeros(stepnum+1,1);
L =zeros(stepnum+1,1);
if  profile == 1
y(1) = max(y1,y2);
for i = 2:stepnum+1
    y(i) = y(i-1) - stepsize;  
end
else
y(1) = min(y1,y2);
for i = 2:stepnum+1
    y(i) = y(i-1) + stepsize;
end
end
A = zeros(stepnum+1,1);
V = zeros(stepnum+1,1);
E = zeros(stepnum+1,1);
R = zeros(stepnum+1,1);
Sf = zeros(stepnum+1,1);
if elev1 == 1
WSE = zeros(stepnum+1,1);
end

if Channel_Type == 2 %(Rectangular)
for i = 1:stepnum+1
    A(i) = y(i)*given_data_b;
    V(i) = given_data_Q/(y(i)*given_data_b);
    E(i) = y(i)+((V(i)^2)/(2*g));
    R(i) = A(i)/(given_data_b+2*y(i));
    if g == 9.81 %(SI Unit)
    Sf(i) = ((given_data_n^2)*(V(i)^2))/(R(i)^(4/3));
    else %(US Unit)
    Sf(i) = ((given_data_n^2)*(V(i)^2))/((1.49^2)*R(i)^(4/3));  
    end
end
else %(Trapez)
for i = 1:stepnum+1
    A(i) = (given_data_b+given_data_m*y(i))*y(i);
    V(i) = given_data_Q/A(i);
    E(i) = y(i)+((V(i)^2)/(2*g));
    R(i) = A(i)/(given_data_b+(2*y(i)*((1+given_data_m^2)^0.5)));
    if g == 9.81 %(SI Unit)
    Sf(i) = ((given_data_n^2)*(V(i)^2))/((R(i)^(4/3)));
    else %(US Unit)
    Sf(i) = ((given_data_n^2)*(V(i)^2))/((1.49^2)*(R(i)^(4/3)));  
    end
end
end 

sumE(1) = 0;
Avg_Sf(1) = 0;
S0_AvgSf(1) = 0;
L(1) =0;

if Channel_Type == 2 %(Rectangular)
for i = 2:stepnum+1
    sumE(i) = E(i)-E(i-1);
    Avg_Sf(i) = (Sf(i-1)+Sf(i))/2;
    S0_AvgSf(i) = given_data_S0-Avg_Sf(i);
    L(i) = sumE(i)/S0_AvgSf(i);
    if elev1 == 1
    WSE(i) = elev+(given_data_S0*L(i))+y(i);
    end
end
else %(Trapez)
for i = 2:stepnum+1
    sumE(i) = E(i)-E(i-1);
    Avg_Sf(i) = (Sf(i-1)+Sf(i))/2;
    S0_AvgSf(i) = given_data_S0-Avg_Sf(i);
    L(i) = abs(sumE(i)/S0_AvgSf(i));
    if elev1 == 1
    WSE(i) = elev+(given_data_S0*abs(L(i)))+y(i);
    end
end
end

Total_Length = abs(sum(L));
if g == 9.81
    fprintf('Total Length(m) = %d\n', Total_Length)
else
    fprintf('Total Length(ft) = %d\n', Total_Length)
end
if elev1 == 1
AllData = table( y, A, R, V, Sf, E, sumE, Avg_Sf, S0_AvgSf, L, WSE);
if g == 9.81
AllData.Properties.VariableNames = ["y(m)","A(m^2)","R(m)","V(m/S)",...
    "Sf","E(m)","sum. E(m)","Avg. Sf","S0-Avg.Sf","L(m)","WSE(m)"];    
else
AllData.Properties.VariableNames = ["y(ft)","A(ft^2)","R(ft)","V(ft/s)",...
    "Sf","E(ft)","sum. E(ft)","Avg. Sf","S0-Avg.Sf","L(ft)","WSE(ft)"];
end
else
AllData = table( y, A, R, V, Sf, E, sumE, Avg_Sf, S0_AvgSf, L);
if g == 9.81
AllData.Properties.VariableNames = ["y(m)","A(m^2)","R(m)","V(m/S)",...
    "Sf","E(m)","sum. E(m)","Avg. Sf","S0-Avg.Sf","L(m)"];    
else
AllData.Properties.VariableNames = ["y(ft)","A(ft^2)","R(ft)","V(ft/s)",...
    "Sf","E(ft)","sum. E(ft)","Avg. Sf","S0-Avg.Sf","L(ft)"];
end
end
%uitable('Data',AllData{:,:},'ColumnName',AllData.Properties.VariableNames,...
%'RowName',AllData.Properties.RowNames,'Units', 'Normalized', 'Position',[0, 0, 1, 1]);
%String = evalc('disp(AllData)');
%String = strrep(String,'<strong>','\bf');
%String = strrep(String,'</strong>','\rm');
%String = strrep(String,'_','\_');

uit = uitable(uifigure,'Data',AllData); 
s = uistyle; 
s.FontColor = 'red';
s.FontWeight = "bold";
addStyle(uit,s); 
s1 = uistyle('BackgroundColor','cyan');
addStyle(uit,s1);
s3 = uistyle('HorizontalAlignment','center');
addStyle(uit,s3);

title = 'Direct Step Method';
fprintf('%70s\n',title);
disp(AllData);
