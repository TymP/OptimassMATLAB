function [boolean] = isStable(inputVector,bandwidth)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
    average=mean(inputVector);
    boolean=true;
    if(((max(abs(inputVector))-average)/average)>bandwidth)
        boolean=false;
    end

end

