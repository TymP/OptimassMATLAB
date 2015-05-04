function [boolean] = forwardStable(currentVector, forwardValue, noise)
%%%[boolean]=forwardStable(currentVector, forwardValue, noise)
%%%Returns false if the forward value relative to the mean of the current
%%%vector exceeds the noise threshold. 
currentMean=mean(currentVector);
boolean = false; 
if abs((forwardValue-currentMean)/currentMean)<=noise
    boolean =true;
end
end
