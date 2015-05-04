function [booleanVector] = centreStable(inputVector, span,bandwidth)
%[boolean vector] = centreStable(inputVector, span, bandwidth)
%   Detailed explanation goes here
booleanVector=zeros(length(inputVector),1);

for i=(span):(length(booleanVector)-span)
    i
    sampleVector=inputVector((i-span/2):1:(i+span/2))
    if isStable(sampleVector,bandwidth)
        booleanVector(i)=1;
    end
end


end

