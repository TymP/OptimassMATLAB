%testscript
span=30;
deadband=10;
bandwidths=[.2,.1,.05,.01,.001];
gains=[20,30,40,50,60,70]
markers={'-r','-g','-c','y','b'}
plot(Time.Hour,FT3020.PosSt);
hold on
for i=1:length(bandwidths)
    trueVec=flowPerformance(FT3020.PosSt,span,bandwidths(i),deadband);
    disp(['Mean value = ',num2str(mean(trueVec))])
    plot(Time.Hour,trueVec*gains(i),markers{i});
    hold on
end

%now vary span
figure
spans=[10,30,50,100,200,300];
span=30;
deadband=10;
bandwidth=.01;
gains=[20,30,40,50,60,70]
markers={'-r','-g','-c','y','b'}
plot(Time.Hour,FT3020.PosSt);
hold on
for i=1:length(bandwidths)
    trueVec=flowPerformance(FT3020.PosSt,spans(i),bandwidth,deadband);
    disp(['Mean value = ',num2str(mean(trueVec))])
    plot(Time.Hour,trueVec*gains(i),markers{i});
    hold on
end