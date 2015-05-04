function [ boolean ] = withinRange(vector,value,noise)
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here
boolean=false;
if abs((value-mean(vector))/mean(vector))<noise
    boolean=true;
end

end

function [boolean] = isForwardStable(vector,index,noise)
boolean=withinRange(vector,mean(vector(index:index+5)));
end

function [index]=findLargestForwardStable(vector,noise,max)
index=max;
for i=1:(length(vector)-5)
    currentVector=vector(1:(i+5);
    if isForwardStable(currentVector,i,noise)==false;
        index=i;
        break;
    end
end
end

function [span]=findSteadyStateSpan(matrix,noise,max)
temp=max;
[row,column]=size(matrix);
for j=1:column
    attempt=findLargestForwardStable(matrix(:,j),noise,max);
    if attempt<temp
        temp=attempt;
    end
end
span=temp;
end

        