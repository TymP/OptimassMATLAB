function [reachIndex]=ssFilter(allData,startIndex,maxIndex,noise)
%%% [reachIndex]=ssFilter(allData [matrix], startIndex, maxIndex, noise
%%% [decimal])
%%%Returns the maximum reachIndex for which all data vectors are forward
%%%stable.
reachIndex=maxIndex;
indexSubVector=[startIndex:1:maxIndex];
subMatrix=allData(indexSubVector);
[row,columns]=size(allData);
initialReachValue=maxIndex-startIndex;
maxReachValue=intialReachValue;
for j=1:columns
    columnOfInterest=dataOfInterest(:,j)
    for i=1:initialReachValue
        currentMean=mean(columnOfInterest(1:i);
        currentFutureValue=mean(columnOfInterest(i:(i+3)));
        if forwardStable(currentMean,currentFutureValue,noise)==false
            if row<=maxReach
                maxReach=row;
            end
            break;
        end
    end
end

        















for j=1:columns
    bingo=findFirstForwardUnstable(subMatrix(:,J),maxIndex)
    for i=startIndex:maxIndex-3;
        currentSubsetIndeces=[startIndex:1:i];
        forwardValueSubsetIndeces=[i:1:(i+3)];
        currentSubset=allData(currentSubsetIndeces,j);
        forwardSubset=allData(forwardValueSubsetIndeces,j);
        forwardValue=mean(forwardSubset);
        if forwardStable(currentSubset,forwardValue,.001)==false
            trialReachIndex=i;
            disp('Transient!')
            transientCount=transientCount+1
            
        end
    end
    if trialReachIndex < reachIndex
        reachIndex=trialReachIndex
    end
end
      

end

