%makeplot2: uses differentcolor set up
figure;
for i=1:length(tempVec)
    color=colorVec{i};
    for j=1:length(flowVec)
        marker=markerVec{j};
        testnums=findTestNums(Test,Temp,Flow,tempVec(i),flowVec(j));
        [var1,var2]=createSubSet(processedData,testnums,variable1,variable2);
        %retrieve extra data for table:reference flow rate, temperature
        [var3,var4]=createSubSet(processedData,testnums,'FT3020','TT7024');
        mark=strcat(color,marker);
        plot(var1,var2,colorMarkVec{j});
        hold on
        if length(testnums)>=1
            legendText{end+1}=[num2str(tempVec(i)),' C, ', num2str(flowVec(j)),' g/s'];
            if strcmp(variable2,'Relative Flow Error')
                [value,index]=max(abs(var2));
                disp(['At nominal flow rate of ' num2str(flowVec(j)),' g/s']);
                disp(['True flow rate of', num2str(var3(index)), 'g/s']);
                disp(['TT7424 of ',num2str(var4(index)),'C']);
                disp(['Maximum mass flow error = ', num2str(value),' at VQ = ',num2str(var1(index))])
            end
        end
        testnums=[];
    end
end
xlabel(variable1,'FontSize',16)
ylabel(variable2,'FontSize',16)
legend(legendText)
