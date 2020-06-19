%% Example FCS Read of 2015-10-18_at_05-15-40pm files

% Hard code runs example FCS experiment with examples for visualization.

% This code was originally written by A.M. Langevin and last edited by
% A.M. Langevin on June 19, 2020.

clc, clear, close

% Hard Coded Inputs:

Samples=5;
Replicates=1; % Two data points from each well
GroupName='2019-01-31_at_06-39-01pm';
BinNo=200;
X_lower=0; % log-scale
X_upper=6; % log-scale

% Samples
% A: JW0451 dKr
% B: rfp/JW0451 dKr
% C: sfgfp/JW0451 dKr
% D: rfp/JW0451 dKr & sfgfp/JW0451 dKr co-culture
% E: MG1655
% F: rfp/MG1655
% G: sfgfp/MG1655
% H: rfp/MG1655 & sfgfp/MG1655 co-culture

% 1: 0 然
% 2: 10 然
% 3: 100 然
% 4: 1000 然

% Extracts Data from FCS files

[FSC,SSC,GRN,YEL,RED_B,RED_R,RED_R_Area,RED_R_Width,Time,Counts]=dataFCS(GroupName,Samples,Replicates);

% Makes bins for the histogram

% Note: this can also be adjusted to a linear scale, if desired (linspace)

X=logspace(X_lower,X_upper,BinNo);

% Reading GRN and RED-B Data

[GRN_mean,GRN_std]=dataAnaFCS(GRN,X,Samples,Replicates,Counts); % Will calculate the mean and std for each sample
[RED_B_mean,RED_B_std]=dataAnaFCS(RED_B,X,Samples,Replicates,Counts); % Will calculate the mean and std for each sample

% Setting up characteristics to plot data

title1='JW0451 dKr';
title2='rfp/JW0451 dKr';
title3='sfgfp/JW0451 dKr';
title4='rfp/JW0451 dKr & sfgfp/JW0451 dKr co-culture';
title5='MG1655';
title6='rfp/MG1655';
title7='sfgfp/MG1655';
title8='rfp/MG1655 & sfgfp/MG1655 co-culture';

xlabel1='GRN';
xlabel2='RED-B';

%% Examples for Visualization - Plotting Fluorescence Histograms

% this visualization is for example experiment "2015-10-18_at_05-15-40pm"
% use the following on lines 12-14:
% Samples=32;
% Replicates=2; % Two data points from each well
% GroupName='2015-10-18_at_05-15-40pm';

% figure(1)
% h1=shadedErrorBar(X,GRN_mean(:,25),GRN_std(:,25),'k',1);
% hold on
% h2=shadedErrorBar(X,GRN_mean(:,26),GRN_std(:,26),'b',1);
% h3=shadedErrorBar(X,GRN_mean(:,27),GRN_std(:,27),'r',1);
% h4=shadedErrorBar(X,GRN_mean(:,28),GRN_std(:,28),'g',1);
% 
% legend([h1.mainLine h2.mainLine h3.mainLine h4.mainLine],{'0然 IPTG' '10然 IPTG' '100然 IPTG' '1000然 IPTG'},'location','northwest')
% 
% hold off
% title(title7)
% xlabel(xlabel1)
% ylabel('Frequency') 
% axis([1 10^6 0 0.1])
% set(gca,'xscale','log')
% 
% figure(2)
% h1=shadedErrorBar(X,RED_B_mean(:,21),RED_B_std(:,21),'k',1);
% hold on
% h2=shadedErrorBar(X,RED_B_mean(:,22),RED_B_std(:,22),'b',1);
% h3=shadedErrorBar(X,RED_B_mean(:,23),RED_B_std(:,23),'r',1);
% h4=shadedErrorBar(X,RED_B_mean(:,24),RED_B_std(:,24),'g',1);
% 
% legend([h1.mainLine h2.mainLine h3.mainLine h4.mainLine],{'0然 IPTG' '10然 IPTG' '100然 IPTG' '1000然 IPTG'},'location','northwest')
% 
% hold off
% title(title6)
% xlabel(xlabel2)
% ylabel('Frequency') 
% axis([1 10^6 0 0.1])
% set(gca,'xscale','log')
% 
% norm_low=30;
% norm_high=300;
% 
% norm=10^5;
% 
% figure(3)
% subplot(1,4,1)
% h1=shadedErrorBar(X,RED_B_mean(:,21),RED_B_std(:,21),'r',1);
% hold on
% h2=shadedErrorBar(X/norm_low,GRN_mean(:,25),GRN_std(:,25),'g',1);
% hold off
% title('0然 IPTG')
% xlabel('Normalized Fluoresence')
% ylabel('Frequency') 
% axis([1 10^4 0 0.1])
% set(gca,'xscale','log')
% 
% subplot(1,4,2)
% h1=shadedErrorBar(X,RED_B_mean(:,22),RED_B_std(:,22),'r',1);
% hold on
% h2=shadedErrorBar(X/norm_high,GRN_mean(:,26),GRN_std(:,26),'g',1);
% hold off
% title('10然 IPTG')
% xlabel('Normalized Fluoresence')
% ylabel('Frequency') 
% axis([1 10^4 0 0.1])
% set(gca,'xscale','log')
% 
% subplot(1,4,3)
% h1=shadedErrorBar(X,RED_B_mean(:,23),RED_B_std(:,23),'r',1);
% hold on
% h2=shadedErrorBar(X/norm_high,GRN_mean(:,27),GRN_std(:,27),'g',1);
% hold off
% title('100然 IPTG')
% xlabel('Normalized Fluoresence')
% ylabel('Frequency') 
% axis([1 10^4 0 0.1])
% set(gca,'xscale','log')
% 
% subplot(1,4,4)
% h1=shadedErrorBar(X,RED_B_mean(:,24),RED_B_std(:,24),'r',1);
% hold on
% h2=shadedErrorBar(X/norm_high,GRN_mean(:,28),GRN_std(:,28),'g',1);
% legend([h1.mainLine h2.mainLine],{'pBbA5K-rfp/MG1655' 'pBbA5K-sfgfp/MG1655'},'location','northeast')
% hold off
% title('1000然 IPTG')
% xlabel('Normalized Fluoresence')
% ylabel('Frequency') 
% axis([1 10^4 0 0.1])
% set(gca,'xscale','log')
% 
% 
% 
% %% Examples for Visualization - Scatter Plots of Individual Samples
% 
% figure(2)
% subplot(1,2,1)
% dscatter(FSC(:,1),10.^(SSC(:,1)/256),'log',1) % Plots SSC vs. FSC data for Sample 1 (Replicate 1)
% hold on
% plot([50 50],[0.01 10^8],'k--') % Plots Threshhold line - change from 50, if necessary
% hold off
% title('Sample 1')
% set(gca,'xscale','log')
% axis([10 10^4 0.01 10^8])
% xlabel('SSC')
% ylabel('FSC')
% 
% 
% subplot(1,2,2)
% dscatter(FSC(:,2),10.^(SSC(:,2)/256),'log',1) % Plots SSC vs. FSC data for Sample 1 (Replicate 2)
% hold on
% plot([50 50],[0.01 10^8],'k--') % Plots Threshhold line - change from 50, if necessary
% hold off
% title('Sample 2')
% set(gca,'xscale','log')
% axis([10 10^4 0.01 10^8])
% xlabel('SSC')
% ylabel('FSC')

%% Test for Small Sample Numbers

% this visualization is for example experiment "2019-01-31_at_06-39-01pm"
% use the following on lines 12-14:
% Samples=5;
% Replicates=1; % Two data points from each well
% GroupName='2019-01-31_at_06-39-01pm';

names={'Sample 1','Sample 2','Sample 3','Sample 4','Sample 5'};

figure(1)
for samp=1:5
    hold on
    plot(X,GRN_mean(:,samp),'-','linewidth',1.5)
end
xlabel('GRN Fluoresence, a.u.')
ylabel('Frequency') 
axis([1 10^4 0 0.15])
set(gca,'xscale','log')
legend(names)
box on

figure(2)
for samp=1:5
    hold on
    plot(X,RED_B_mean(:,samp),'-','linewidth',1.5)
end
xlabel('RED-B Fluoresence, a.u.')
ylabel('Frequency') 
axis([1 10^4 0 0.15])
set(gca,'xscale','log')
legend(names)
box on

figure(3)
for samp=1:5
    subplot(1,Samples,samp)
    scatter(FSC(:,samp),SSC(:,samp),'k.')
    hold on
    plot([30 30],[0.01 10^8],'k--') % Plots Threshhold line - change from 50, if necessary
    hold off
    set(gca,'xscale','log')
    set(gca,'yscale','log')
    axis([10 10^4 0.01 10^8])
    xlabel('SSC')
    ylabel('FSC')
    title(names(samp))
    box on
end