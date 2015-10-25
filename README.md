# obtainingDataProject
Final Project for the Johns Hopkins Obtaining Data course

This project takes in data from the Human Activity Recognition Using Smartphones Dataset and prodcues a clean dataset of average mean and standard deviation readings grouped by person id and activity type.

The R script reads in data from a data directory.  This data directory has a a "train" and "test" directory in it, with data from the study.

The script takes this data, merges it into one table, extracts the mean and standard deviation readings along with the personIds and Activity types, and creates a data.frame that has the average of these means and standards deviations grouped by personid and activity type.  The script outputs a cleanoutput.txt file that represents the data.frame in long format.

Variable name definitions can be found in the codebook file, which is also in this project.


You can find the data for this project at the following URL

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

place the "train" and "test" directories inside a "data" directory, that you place within the root of the project.  I have not uploaded this to github for size considerations.
