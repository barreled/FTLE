# FTLE
SDSU Bioengineering Lab FTLE analysis code

The master script to rerun all of the studies is called 'runscripts.m' and is run from Matlab. It was written using Matlab 2011a on a Linux machine, and uses Linux file system commands. It expects velocity files to be stored under a file structure like "bin/*bag name*/*LVAD speed*/" where *bag name* and *LVAD speed* are written in the script. The conversion from the B00xxx.txt velocity files into binary files is done using the 'bin/ascii2binnC.py' file using Python 2.7. To change the settings used for flowVC, modify 'input/forward_template.in' and 'input/reverse_template.in'. These files will be read by 'bin/changelimits.py', which will create a 'input/forward.in' and 'input/reverse.in' updated to use the proper boundaries from the current velocity files. 'output/conversion.py' creates a series of .csv files from the flowVC output. 'visualize.m' will read the .csv files into Matlab, save the data as a series of .mat files, and creates FTLE field .tif images from the data. It can also turn the images into a video if that section of code isn't commented out.

Dependancies: Python 2.7, Matlab 2011a, Linux, flowVC version 1

This code makes use of flowVC.
Shadden, S. C. (2010) FlowVC (Version 1) [Computer software]. Retrieved from http://shaddenlab.berkeley.edu/software/. 
