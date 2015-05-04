%makeplot script
%%%generates a plot given the user-specified variables and test conditions
%%%of interest in the generatePlots script. calls the findTestNums funciton
%%%to define a cell array of test vectors with conditions of interest.
figure;
for i=1:length(tempVec)
    color=colorVec{i};
    for j=1:length(flowVec)
        marker=markerVec{j};
        testnums=findTestNums(Test,Temp,Flow,tempVec(i),flowVec(j));
        %Retrieve data of interest from steady-state database
        %(processedData)
        [var1,var2]=createSubSet(processedData,testnums,variable1,variable2);
        mark=strcat(color,marker);
        plot(var1,var2,mark);
        hold on
        if length(testnums)>=1
            legendText{end+1}=[num2str(tempVec(i)),' C, ', num2str(flowVec(j)),' g/s'];
            
        end
        testnums=[];
    end
end
xlabel(variable1,'FontSize',16)
ylabel(variable2,'FontSize',16)
legend(legendText)
