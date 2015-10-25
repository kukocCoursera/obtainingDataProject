library(reshape)
library(reshape2)

new_col_names = c("personid","activitytype","meanxtbodyacceleration","meanytbodyacceleration","meanztbodyacceleration","standarddeviationxtbodyacceleration","standarddeviationytbodyacceleration","standarddeviationztbodyacceleration","meanxtgravityacceleration","meanytgravityacceleration","meanztgravityacceleration","standarddeviationxtgravityacceleration","standarddeviationytgravityacceleration","standarddeviationztgravityacceleration","meanxtbodyjerkacceleration","meanytbodyjerkacceleration","meanztbodyjerkacceleration","standarddeviationxtbodyjerkacceleration","standarddeviationytbodyjerkacceleration","standarddeviationztbodyjerkacceleration","meanxtbodygyroscope","meanytbodygyroscope","meanztbodygyroscope","standarddeviationxtbodygyroscope","standarddeviationytbodygyroscope","standarddeviationztbodygyroscope","meanxtbodygyroscopejerk","meanytbodygyroscopejerk","meanztbodygyroscopejerk","standarddeviationxtbodygyroscopejerk","standarddeviationytbodygyroscopejerk","standarddeviationztbodygyroscopejerk","meantbodyaccelerationmagnitude","standarddeviationtbodyaccelerationmagnitude","meantgravityaccelerationmagnitude","standarddeviationtgravityaccelerationmagnitude","meantbodyaccelerationjerkmagnitude","standarddeviationtbodyaccelerationjerkmagnitude","meantbodygyroscopemagnitude","standarddeviationtbodygyroscopemagnitude","meantbodygyroscopejerkmagnitude","standarddeviationtbodygyroscopejerkmagnitude","meanxfbodyaccleration","meanyfbodyaccleration","meanzfbodyaccleration","standarddeviationxfbodyaccleration","standarddeviationyfbodyaccleration","standarddeviationzfbodyaccleration","meanxfbodyaccelerationjerk","meanyfbodyaccelerationjerk","meanzfbodyaccelerationjerk","standarddeviationxfbodyaccelerationjerk","standarddeviationyfbodyaccelerationjerk","standarddeviationzfbodyaccelerationjerk","meanxfbodygyroscope","meanyfbodygyroscope","meanzfbodygyroscope","standarddeviationxfbodygyroscope","standarddeviationyfbodygyroscope","standarddeviationzfbodygyroscope","meanfbodyaccelerationmagnitude","standarddeviationfbodyaccelerationmagnitude","meanfbodybodyaccelerationjerkmagnitude","standarddeviationfbodybodyaccelerationjerkmagnitude","meanfbodybodygyroscopemagnitude","standarddeviationfbodybodygyroscopemagnitude","meanfbodybodygyroscopejerkmagnitude","standarddeviationfbodybodygyroscopejerkmagnitude") 

# create data directory

if(!file.exists("data"))
  dir.create("data")


#get vector of indicies that point to the data we're going to want
mean_std_indicies = c(1,2,3,4,5,6,41,42,43,44,45,46,81,82,83,84,85,86,121,122,123,124,125,126,161,162,163,164,165,166,201,202,214,215,227,228,240,241,253,254,266,267,268,269,270,271,345,346,347,348,349,350,424,425,426,427,428,429,503,504,516,517,529,530,542,543)
mean_std_indicies = mean_std_indicies + 1
mean_std_indicies <- c(c(1), mean_std_indicies, c(563))


# read in training data

subject_train_data <- read.table("./data/train/subject_train.txt")
subject_x_train <- read.table("./data/train/X_train.txt")
subject_y_train <- read.table("./data/train/y_train.txt")

# read in test data

subject_test_data <- read.table("./data/test/subject_test.txt")
subject_x_test <- read.table("./data/test/X_test.txt")
subject_y_test <- read.table("./data/test/y_test.txt")


# check rowcounts of data - i'd like the three sets of numbers to match
# commenting out below for submission, but keeping for checking going forward
#nrow(subject_train_data)
#nrow(subject_x_train)
#nrow(subject_y_train)


#nrow(subject_test_data)
#nrow(subject_x_test)
#nrow(subject_y_test)

# check completeness of data.frames (i'd like these to all be 0)
#sum(!complete.cases(subject_train_data))
#sum(!complete.cases(subject_x_train))
#sum(!complete.cases(subject_y_train))

#sum(!complete.cases(subject_test_data))
#sum(!complete.cases(subject_x_test))
#sum(!complete.cases(subject_y_test))


# make 1 table for both the train data and the test data

names(subject_train_data)[names(subject_train_data)=="V1"] <- "person_id"
names(subject_y_train)[names(subject_y_train)=="V1"] <- "activity_id"

new_train_data <- cbind(subject_train_data, cbind(subject_y_train, subject_x_train))

names(subject_test_data)[names(subject_test_data)=="V1"] <- "person_id"
names(subject_y_test)[names(subject_y_test)=="V1"] <- "activity_id"

new_test_data <- cbind(subject_test_data, cbind(subject_y_test, subject_x_test))

# let's merge the datasets!

merged_data <- rbind(new_train_data, new_test_data)


# OK, datasets are merged, lets get the data we need.
mean_std_merged_data <- merged_data[,mean_std_indicies]

# need to change the number value of activity_id to a proper character vector that describes it
mean_std_merged_data$activity_id[mean_std_merged_data$activity_id == "1"]  <- "WALKING"
mean_std_merged_data$activity_id[mean_std_merged_data$activity_id == "2"]  <- "WALKING_UPSTAIRS"
mean_std_merged_data$activity_id[mean_std_merged_data$activity_id == "3"]  <- "WALKING_DOWNSTAIRS"
mean_std_merged_data$activity_id[mean_std_merged_data$activity_id == "4"]  <- "SITTING"
mean_std_merged_data$activity_id[mean_std_merged_data$activity_id == "5"]  <- "STANDING"
mean_std_merged_data$activity_id[mean_std_merged_data$activity_id == "6"]  <- "LAYING"

#give the new data frame meaningful names
colnames(mean_std_merged_data) <- new_col_names


# melt the data from long form to tall form

melted_data <- melt(mean_std_merged_data, id=c("personid", "activitytype"))

# group by person id and activity type, and take the means of the remaining values

user_activity_dataset_clean <- dcast(thingie, personid + activitytype ~ variable, mean)

#make it long again
user_activity_dataset_clean <- melt(mean_std_merged_data, id=c("personid", "activitytype"))


write.table(user_activity_dataset_clean, file="cleanoutput.txt", row.names = FALSE)