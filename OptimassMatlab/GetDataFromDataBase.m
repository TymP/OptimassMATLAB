%Bart Verlaat April 2015
clear
CurrentDir=pwd;
addpath([CurrentDir,'\Functions\']);
files=dir('.\CSVfiles\*');
%Time format: dd-Mmm-yy hh:mm:ss
Tmin='22-Apr-14 10:57:00';
Tmax='22-Apr-16 10::57:43';
label={'all'};
ExtractOption=1;
data=DataRetrieve(Tmin,Tmax,label,ExtractOption);
Separate;

