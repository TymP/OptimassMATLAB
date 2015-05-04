function [booleanVector] = flowPerformance(flowVector,span,bandwidth,deadBand)
%[boolean vector] = flowPerformance(flowVector,deadBand[g/s],bandwidth
%[decimal]
% takes in a vector of flow rates in g/s, ensures that the flow is stable
% and significantly positive.
booleanVector=zeros(length(flowVector),1);

for i=span:(length(booleanVector)-span)
    sampleVector=flowVector((i+1-span):i);
    if (isStable(sampleVector,bandwidth) && mean(sampleVector)>deadBand)
        booleanVector(i)=1;
    end
end

end

