function [booleanVector] = backwardStable(inputVector, span,bandwidth)
%UNTITLED3 Summary of this function goes here
%   
booleanVector=zeros(length(inputVector),1);
for i=(span+1):length(inputVector)
    sampleVector=inputVector([(i-span):1:i]);
    if isStable(sampleVector,bandwidth)
        booleanVector(i)=1;
    end
end
   


end

