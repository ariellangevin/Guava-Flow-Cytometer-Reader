function [FSC,SSC,GRN,YEL,RED_B,RED_R,RED_R_Area,RED_R_Width,Time,Counts]=dataFCS(GroupName,Samples,Replicates)

% Function outputs the data for the samples.

% This code was originally written by A.M. Langevin and last edited by
% A.M. Langevin on June 19, 2020.

% INPUTS:
% GroupName: Name of files that will be called
% Samples: Number of samples for the run
% Replicates: Number of replicates for each sample
% Plots: Types of plots to call in the function, list as an  array for
% multiple figures
% 1 - FSC
% 2 - SSC
% 3 - GRN
% 4 - YEL
% 5 - RED-B
% 6 - RED-R
% 7 - RED-R Area
% 8 - RED-R Width
% 9 - Time

% OUTPUTS:
% Matrices storing data for each sample
% 1 - FSC
% 2 - SSC
% 3 - GRN
% 4 - YEL
% 5 - RED-B
% 6 - RED-R
% 7 - RED-R Area
% 8 - RED-R Width
% 9 - Time

%Initialize histogram plots

clc, close

Replicates=Replicates;
I = Samples*Replicates;
    
maxcount=5000; % this should be hard set, but may be more for a particular user or machine

% Empty data arrays % note: these are nan so that if the flow doesn't read
% to maxcount then the output can still be given.
FSC=nan(maxcount,I);
SSC=nan(maxcount,I);
GRN=nan(maxcount,I);
YEL=nan(maxcount,I);
RED_B=nan(maxcount,I);
RED_R=nan(maxcount,I);
RED_R_Area=nan(maxcount,I);
RED_R_Width=nan(maxcount,I);
Time=nan(maxcount,I);

% Collect Data for Samples

for i=1:I
    filename=[GroupName '-' num2str(i) '.fcs'];
    [fcsdat] = fca_readfcs(filename);
    [a,~]=size(fcsdat);
    %update matrix for flow out puts
    FSC(1:a,i)=fcsdat(:,1);
    SSC(1:a,i)=fcsdat(:,2);
    GRN(1:a,i)=fcsdat(:,3);
    YEL(1:a,i)=fcsdat(:,4);
    RED_B(1:a,i)=fcsdat(:,5);
    RED_R(1:a,i)=fcsdat(:,6);
    RED_R_Area(1:a,i)=fcsdat(:,7);
    RED_R_Width(1:a,i)=fcsdat(:,8);
    Time(1:a,i)=fcsdat(:,9);
    Counts(1,i)=a;
    
    if a<maxcount
       fprintf('%s only had %d of %d events.\n', filename, a, maxcount) % report back that this file has a no. of counts
    end
    
end