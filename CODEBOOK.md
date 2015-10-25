# obtainingDataProject
# Code Book

# Variable Information

Here are the variables that are in the final data table.  Most of this description is from the documentation that came with the study data.

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

mean(): Mean value
std(): Standard deviation


Here are the variable names you will find in the tidy dataset, which are combomations of the signals specified above and the words "mean" and "standard deviation"

personid   - a number between 1-30 representing the individual that is being monitored.
activitytype - a movement state, either WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING or LAYING
meanxtbodyacceleration
meanytbodyacceleration
meanztbodyacceleration
standarddeviationxtbodyacceleration
standarddeviationytbodyacceleration
standarddeviationztbodyacceleration
meanxtgravityacceleration
meanytgravityacceleration
meanztgravityacceleration
standarddeviationxtgravityacceleration
standarddeviationytgravityacceleration
standarddeviationztgravityacceleration
meanxtbodyjerkacceleration
meanytbodyjerkacceleration
meanztbodyjerkacceleration
standarddeviationxtbodyjerkacceleration
standarddeviationytbodyjerkacceleration
standarddeviationztbodyjerkacceleration
meanxtbodygyroscope
meanytbodygyroscope"
meanztbodygyroscope
standarddeviationxtbodygyroscope
standarddeviationytbodygyroscope
standarddeviationztbodygyroscope
meanxtbodygyroscopejerk
meanytbodygyroscopejerk
meanztbodygyroscopejerk
standarddeviationxtbodygyroscopejerk
standarddeviationytbodygyroscopejerk
standarddeviationztbodygyroscopejerk
meantbodyaccelerationmagnitude
standarddeviationtbodyaccelerationmagnitude
meantgravityaccelerationmagnitude
standarddeviationtgravityaccelerationmagnitude
meantbodyaccelerationjerkmagnitude
standarddeviationtbodyaccelerationjerkmagnitude
meantbodygyroscopemagnitude
standarddeviationtbodygyroscopemagnitude
meantbodygyroscopejerkmagnitude
standarddeviationtbodygyroscopejerkmagnitude
meanxfbodyaccleration
meanyfbodyaccleration
meanzfbodyaccleration
standarddeviationxfbodyaccleration
standarddeviationyfbodyaccleration
standarddeviationzfbodyaccleration
meanxfbodyaccelerationjerk
meanyfbodyaccelerationjerk
meanzfbodyaccelerationjerk
standarddeviationxfbodyaccelerationjerk
standarddeviationyfbodyaccelerationjerk
standarddeviationzfbodyaccelerationjerk
meanxfbodygyroscope
meanyfbodygyroscope
meanzfbodygyroscope
standarddeviationxfbodygyroscope
standarddeviationyfbodygyroscope
standarddeviationzfbodygyroscope
meanfbodyaccelerationmagnitude
standarddeviationfbodyaccelerationmagnitude
meanfbodybodyaccelerationjerkmagnitude
standarddeviationfbodybodyaccelerationjerkmagnitude
meanfbodybodygyroscopemagnitude
standarddeviationfbodybodygyroscopemagnitude
meanfbodybodygyroscopejerkmagnitude
standarddeviationfbodybodygyroscopejerkmagnitude


# Summary Choices Made

The choices I made were pretty much the requirements of the assignment.

You should create one R script called run_analysis.R that does the following. 
Merges the training and the test sets to create one data set.
Extracts only the measurements on the mean and standard deviation for each measurement. 
Uses descriptive activity names to name the activities in the data set
Appropriately labels the data set with descriptive variable names. 
From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.


# Experimental Study Design Used

There was no experimental study done on my part.  This project uses the study data done by the Human Activity Recognition Using Smartphones Dataset.

You can find more information about this study here: www.smartlab.ws 

I have also included a StudyReadme.txt file that describes the study.


Here is the first paragraph about the study

Final Project for the Johns Hopkins Obtaining Data course

This project takes in data from the Human Activity Recognition Using Smartphones Dataset and prodcues a clean dataset of average mean and standard deviation readings grouped by person id and activity type.

The R script reads in data from a data directory.  This data directory has a a "train" and "test" directory in it, with data from the study.

The script takes this data, merges it into one table, extracts the mean and standard deviation readings along with the personIds and Activity types, and creates a data.frame that has the average of these means and standards deviations grouped by personid and activity type.  The script outputs a cleanoutput.txt file that represents the data.frame in long format.

Variable name definitions can be found in the codebook file, which is also in this project.
