%create Filter
%creates a boolean filter vector to elimenate all non- steady-state or
%otherwise uninteresting data points in the array.
allData=[FT3020.PosSt,EHDL1.PosSt,EHDL2.PosSt,PT7024.PosSt,TT7024.PosSt,PT7450.PosSt,FT7524.PosSt,DT7424.PosSt,TT7424.PosSt,PT7056.PosSt,TT7056.PosSt];
cd analysisFunctions
%Elimenate placeholder values
NaNvec=findNaN(allData);
mean(NaNvec)
%Ensure plant flow is stable and positive.
plantFlowVec=flowPerformance(FT3020.PosSt,30,.01,15);
mean(plantFlowVec)
%Ensure loop flow is stable and positive
loopFlowVec=flowPerformance(FT7524.PosSt,30,.01,1);
mean(loopFlowVec)
%ENsure heater power stability.
heatStable=backwardStable(EHDL1.PosSt.*EHDL2.PosSt,30,.001);
mean(heatStable)
%Ensure density reading stable. Well above bottom value of reader.
densityStable=flowPerformance(DT7424.PosSt,30,.01,110);
mean(densityStable)
%Return line temperature stable.
returnTempStable=backwardStable(TT7056.PosSt,30,.05);
mean(returnTempStable)

%multiply all boolean vectors together for final filter.
filterVec=NaNvec.*plantFlowVec.*loopFlowVec.*heatStable.*densityStable.*returnTempStable;
mean(filterVec)

indexVector=[];

for i=1:length(filterVec)
    if filterVec(i)==1
        indexVector(end+1)=i;
    end
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

cleanData=[zeros(length(FT3020.Clean),1),zeros(length(FT3020.Clean),1),zeros(length(FT3020.Clean),1),FT3020.Clean,EHDL1.Clean,EHDL2.Clean,PT7024.Clean,TT7024.Clean,PT7450.Clean,FT7524.Clean,DT7424.Clean,TT7424.Clean,PT7056.Clean,TT7056.Clean];
cd ..