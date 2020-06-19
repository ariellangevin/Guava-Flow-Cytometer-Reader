function [Mean,Std]=dataAnaFCS(Data,Bins,Samples,Replicates,Counts)

% Function outputs the desired plots for the samples.

% This code was originally written by A.M. Langevin and last edited by
% A.M. Langevin on June 10, 2016.

% INPUTS:
% Data - matrix containing data for all samples for a given stream (ie. GRN
%   or FSC)
% Bins - location of bins on X axis
% Samples: Number of samples for the run
% Replicates: Number of replicates for each sample
% Counts: Number of counts from each sample

% OUTPUTS:
% Mean - the mean of the histogram of the replicates for each sample
% Std - the std of the histogram of the replicates for each sample

I=Samples*Replicates; % replicates are conducted on after the other

Mean=zeros(length(Bins),Samples);
Std=zeros(length(Bins),Samples);

if Replicates==1
  
    for i=1:I
        n=hist(Data(:,i),Bins); % make histogram
        norm_n=n/Counts(i); % normalize histogram
        Mean(:,i)=norm_n; % just one data set
        %Std(:,k) is zero since this is a single data point
    end
    
    
elseif Replicates>1

    for i=1:Replicates:I
        N=[];
        for j=1:Replicates
            n=hist(Data(:,i+j-1),Bins); % make histogram
            norm_n=n/Counts(i+j-1); % normalize histogram
            N=[N norm_n']; % compile histograms
        end
        k=(i+(Replicates-1))/Replicates; % locations of replicates in dataset
        Mean(:,k)=(nanmean(N'))';
        Std(:,k)=(nanstd(N'))';
    end

end