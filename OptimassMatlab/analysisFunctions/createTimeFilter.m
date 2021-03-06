%Tym Pakulski April 2015

%create time filter
ssStamps=ssDates+ssTimes;

%all formats DD-mmm-YY HH:MM:SS
%times=['15-Apr-15 10:20:00'];
allData=[FT3020.PosSt,EHDL1.PosSt,EHDL2.PosSt,PT7024.PosSt,TT7024.PosSt,PT7450.PosSt,FT7524.PosSt,DT7424.PosSt,TT7424.PosSt,PT7056.PosSt,TT7056.PosSt];
%times={'11:05';'11:15';'11:24';'11:31';'11:39';'11:48';'12:05'};
%for i=1:length(times)
%    times(i)=strcat({'08-Apr-15 '},times(i),':00');
%end
%matlabTimes=datenum(times);
matlabTimes=ssStamps;
cd analysisFunctions
indexVector=[];
for i=1:length(ssStamps)
   indexVector(end+1)=findClosestValue(Time.Day,matlabTimes(i));
end

[rows, columns]=size(allData);
cleanUnlabeled=zeros(length(indexVector),columns);
for column=1:columns
    for row=1:length(indexVector)
        cleanUnlabeled(row,column)=allData(indexVector(row),column);
    end
end

FT3020.Clean=cleanUnlabeled(:,1);
EHDL1.Clean=cleanUnlabeled(:,2);
EHDL2.Clean=cleanUnlabeled(:,3);
PT7024.Clean=cleanUnlabeled(:,4);
TT7024.Clean=cleanUnlabeled(:,5);
PT7450.Clean=cleanUnlabeled(:,6);
FT7524.Clean=cleanUnlabeled(:,7);
DT7424.Clean=cleanUnlabeled(:,8);
TT7424.Clean=cleanUnlabeled(:,9);
PT7056.Clean=cleanUnlabeled(:,10);
TT7056.Clean=cleanUnlabeled(:,11);

cleanData=[Test,Flow,Temp,FT3020.Clean,EHDL1.Clean,EHDL2.Clean,PT7024.Clean,TT7024.Clean,PT7450.Clean,FT7524.Clean,DT7424.Clean,TT7424.Clean,PT7056.Clean,TT7056.Clean];
cd ..