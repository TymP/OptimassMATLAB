function [average]= grabAverage(vector,index, fistFull)
sampleIndexVector=(index-fistFull):1:index;
length(sampleIndexVector)
sampleIndexVector
average=mean(vector(sampleIndexVector));

end
