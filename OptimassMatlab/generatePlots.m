%SCRIPT - generatePlots
%%%Calls the make plot function with the user-specified test conditions to
%%%generate a series of plots. These are then saved to the '/plots'
%%%directory as .png files.
importTestLog;
%OVERVIEW Plots
%Mass Errors
%Define variables to plot.
variable1='Vapour Quality';
variable2='Relative Flow Error';
%Create elements of legend vector.
colorVec={'b','g','r','c','m','k','y'};
markerVec={'o','x','s','+','*','<','p','h','V'};
%Define test conditions of interest.
tempVec=[-25,-20,-10,-5,0,5,10];
flowVec=[20,30,40,50,60,70,80,90,105];
legendText={};
makePlot;
title([variable2, ' against ', variable1, ' at various Temperatures and Flow Rates.'],'FontSize',18);
%Change directory to export functions.
cd figureExport
%Maximise figure window
set(gcf,'units','normalized','outerposition',[0 0 1 1])
%Export figure to 'plots' directory.
export_fig ../plots/fig1.png
cd ..

%Repeat the proces for each figure.
%Density Errors************
variable1='Vapour Quality';
variable2='Relative Density Error';
legendText={};
makePlot;
title([variable2, ' against ', variable1, ' at various Temperatures and Flow Rates.'],'FontSize',18);
cd figureExport
set(gcf,'units','normalized','outerposition',[0 0 1 1])
export_fig ../plots/fig2.png
cd ..

%Series 2: Performance at -10 for various flow rates*****
%create combined markervec
colorMarkVec={'ro','go','bo','rx','gx','bx','r>','g>','b>'};
variable1='Vapour Quality';
variable2='Relative Flow Error';
colorVec={'b','g','r','c','m','k','y'};
markerVec={'o','x','s','+','*','<','p','h','V'};
tempVec=[-10];
flowVec=[20,30,40,50,60,70,80,90,105];
legendText={};
makePlot2;
title([variable2, ' against ', variable1, ' at -10 C, various Flow Rates.'],'FontSize',18);
cd figureExport
set(gcf,'units','normalized','outerposition',[0 0 1 1])
export_fig ../plots/fig3.png
cd ..

%Density Errors************
variable2='Relative Density Error';
legendText={};
makePlot2;
title([variable2, ' against ', variable1, ' at -10 C, various Flow Rates.'],'FontSize',18);
cd figureExport
set(gcf,'units','normalized','outerposition',[0 0 1 1])
export_fig ../plots/fig4.png
cd ..

%GAS VELOCITY
variable2='Gas Velocity'
legendText={};
makePlot2;
title(['Vapour Phase Velocity against ', variable1, ' at -10 C, various Flow Rates.'],'FontSize',18);
ylabel('Vapour Phase Velocity [m/s]','FontSize',18)
cd figureExport
set(gcf,'units','normalized','outerposition',[0 0 1 1])
export_fig ../plots/fig12.png
cd ..

%Series 3: 70 g/s, various Temperatures
flowVec=[70];
tempVec=[-25,-20,-10,-5,0,5,10];
%Flow error against vq
variable2='Relative Flow Error';
legendText={};
makePlot3;
title([variable2, ' against ', variable1, ' at ', num2str(flowVec(1)),' g/s, various Temperatures'],'FontSize',18);
cd figureExport
set(gcf,'units','normalized','outerposition',[0 0 1 1])
export_fig ../plots/fig5.png
cd ..

%Density error against vq for various temperatures
variable2='Relative Density Error';
legendText={};
makePlot3;
title([variable2, ' against ', variable1, ' at ', num2str(flowVec(1)),' g/s, various Temperatures'],'FontSize',18);
cd figureExport
set(gcf,'units','normalized','outerposition',[0 0 1 1])
export_fig ../plots/fig6.png
cd ..

%series 4: same thing at 30 g/s, various temperatures
flowVec=[30];
tempVec=[-25,-20,-10,-5,0,5];
%Flow error against vq
variable2='Relative Flow Error';
legendText={};
makePlot3;
title([variable2, ' against ', variable1, ' at ', num2str(flowVec(1)),' g/s, various Temperatures'],'FontSize',18);
cd figureExport
set(gcf,'units','normalized','outerposition',[0 0 1 1])
export_fig ../plots/fig7.png
cd ..

%Density error against vq
variable2='Relative Density Error';
legendText={};
makePlot3;
title([variable2, ' against ', variable1, ' at ', num2str(flowVec(1)),' g/s, various Temperatures'],'FontSize',18);
cd figureExport
set(gcf,'units','normalized','outerposition',[0 0 1 1])
export_fig ../plots/fig8.png
cd ..

%again for VQ error
variable2='Relative Vapour Quality Error';
legendText={};
makePlot3;
title([variable2, ' against ', variable1, ' at ', num2str(flowVec(1)),' g/s, various Temperatures'],'FontSize',18);
cd figureExport
set(gcf,'units','normalized','outerposition',[0 0 1 1])
export_fig ../plots/fig9.png
cd ..

%VQ error at 20g/s, -10
flowVec=[20];
tempVec=[-10];
legendText={};
makePlot3;
title([variable2, ' against ', variable1, ' at ', num2str(flowVec(1)),'g/s, ', num2str(tempVec(1)),' C'],'FontSize',18);
cd figureExport
set(gcf,'units','normalized','outerposition',[0 0 1 1])
export_fig ../plots/fig10.png
cd ..

%REPEATABILITY PLOTS *******************
figure;
%70 g/s, -10 C
testnums=[182,61,50,20];
color={'r','b','g','m'};
variable1='Vapour Quality';
variable2='Relative Flow Error';
for i=1:length(testnums)
    marker=strcat(color{i},'o');
    [var1,var2]=createSubSet(processedData,testnums(i),variable1,variable2);
    plot(var1,var2,marker)
    hold on
end
hold on
variable2='Relative Density Error'
for i=1:length(testnums)
    marker=strcat(color{i},'s');
    [var1,var2]=createSubSet(processedData,testnums(i),variable1,variable2);
    plot(var1,var2,marker)
    hold on
end
legend('Test 1 Flow Error','Test 2 Flow Error','Test 3 Flow Error','Test 4 Flow Error','Test 1 Density Error','Test 2 Density Error','Test 3 Density Error','Test 4 Density Error')
xlabel(variable1,'FontSize',16)
ylabel('Relative Error','FontSize',16)
title('Mass and Density Error repeatability at 70 g/s, -10 C', 'FontSize',18);
cd figureExport
set(gcf,'units','normalized','outerposition',[0 0 1 1])
export_fig ../plots/fig11.png
cd ..