%Pressure drop calculation
%INPUTS***************************************************************
%Flow Characteristics
T=-16.7; %C
P = 26.3; %bar
m=.0036; %kg/s

%Geometry
d=.00175;%m
L = 3.2; % m
R = .015*10^(-3); % m absolute roughness


%***********************************************************************
%Unit Conversions to REFPROP
P=P*100;%kPa
T=T+273;%K
relR=R/d;

%Determining Density
cd('../REFPROP'); %Change path to location of REFPROP files.
D=refpropm('D','T',T,'P',P,'CO2');%kg/m^3
%D = 1032; %kg/m^3

%Determining Viscosity
%mu=145.1*10^(-6);%Pas
mu=refpropm('V','T',T,'P',P,'CO2');

%Volumetric Flow Rate
Q=m/D; %m^3/s
%Flow Velocity__
v=Q/(pi*(d/2)^2); %m/s

%Calculating Reynolds Number
Re=D*v*d/mu;


%User Input: DARCY FRICTION FACTOR*************************************
display(['Reynolds = ', num2str(Re)])
if(Re>2040)
    display('Flow is turbulent.')
end
disp(['Relative Roughness = ', num2str(relR)]) 
Df = input('Read Darcy friction factor from Moody diagram: ');
%Df=.026; 
%************************************************************************

%Calculating Pressure Drop
dP = Df*L/d*D*v^2/2; %Pa

%Determine Phase
newP = P - dP/1000; %kPa

%Enthalpy at 4:
H4=refpropm('H','T',T,'P',P,'CO2');
%Q=refpropm('Q','T',T,'P',newP,'CO2')
%Vapor quality at 4*
Q4=refpropm('Q','H',H4,'P',newP,'CO2');

%User info:
display(['Pressure drop = ', num2str(dP/10^5), ' bar'])
if(Q4>0)
    display('Flow is 2-phase after pressure drop.')
    display(Q4)
else
    display('Flow is liquid after pressure drop.')
end


