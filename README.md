# Guava-Flow-Cytometer-Reader
These scripts are to read single FCS 3.0 files from a Guava Flow Cytometer and extracts data, bins in defined histograms, and visualizes replicates with their error bars.

### Exporting FCS 3.0 Files from Guava:

1. After completing your experiment, go to the Analyze tab under InCyte. If your data set is not already there then open it.
2. Export the files as FCS 3.0 files, under the "" tab.

You will have individual FCS files named as "(Date and Time Stamp)-(Sample Number).fcs" or "2015-10-18_at_05-15-40pm-1.fcs", for example.

## File Guide:

- *FCS_SampleRead.m*: Hard coded script where users can enter inputs, including the information about the sample set and histogram settings. Example run and figures for a data set that reached the required counts for the flow cytometer. (Assosciated data set is "2015-10-18_SampleRead".)
- *FCS_SmallSampleRead.m*: Another hard coded example, this data set has a lower count number for each sample than the device's required count number. This example also has no replicates. (Assosciated data set is "2019-01-31_SmallSampleRead".)
 
### Functions:
- *dataFCS.m*: This extracts your data from the FCS files and sorts them into their appropriate channel (ie. Green, Red-B, etc.), each column is an individual sampling
- *dataAnaFCS.m*: This function takes your data and sorts it into bins for a histogram. If you have replicates, this step will compute the average and the standard deviation for that well. Each column in the matrices that are outputs are individual wells.
- *fca_readfcs.m* (Henson, 2016): This reads the FCS files. If you want to extract the data for one sample you can just use this. Sample calls are included in the Matlab file
  - *dscatter.m* (Henson, 2016): This creates a scatter plot (of the Forward and Side distributions) for your individual samples.
- *shadedErrorBar.m* (Campbell, 2009): Plots the mean value for each well and its standard deviation is shown by the shaded area.

### References:
- Robert Henson (2016). Flow Cytometry Data Reader and Visualization (https://www.mathworks.com/matlabcentral/fileexchange/8430-flow-cytometry-data-reader-and-visualization), MATLAB Central File Exchange. Retrieved August 7, 2015.
- Rob Campbell (2009). raacampbell/shadedErrorBar (https://www.github.com/raacampbell/shadedErrorBar), GitHub. Retrieved January 13, 2016.

