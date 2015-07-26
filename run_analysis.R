## ---------------------------------------------------
## Coursera - Getting and Cleaning Data Course Project
## Ian C. Olson - July 25, 2015
## ---------------------------------------------------
##
## Description of data: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 
## Data source: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

## 1.Merge the training and the test sets to create one data set.
# Read in the data, add column titles, and join labels, subjects, and set
features <- read.table("features.txt")

X_test <- read.table("test/X_test.txt")
names(X_test) <- features[,2]
Y_test <- read.table("test/Y_test.txt")
names(Y_test) <- "Activity_ID"
subject_test <- read.table("test/subject_test.txt")
names(subject_test) <- "Subject"
test_data <- cbind(subject_test,Y_test,X_test)

X_train <- read.table("train/X_train.txt")
names(X_train) <- features[,2]
Y_train <- read.table("train/Y_train.txt")
names(Y_train) <- "Activity_ID"
subject_train <- read.table("train/subject_train.txt")
names(subject_train) <- "Subject"
train_data <- cbind(subject_train,Y_train,X_train)

# Combine test and train data
full_data <- rbind(test_data,train_data)

## 2.Extract only the measurements on the mean and standard deviation for each measurement. 
mean_cols <- grep("mean()", names(full_data), fixed=TRUE) # fixed parameter excludes meanFreq() data
std_cols <- grep("std()", names(full_data))
mean_std_data <- full_data[,c(1,2,mean_cols,std_cols)]

## 3.Use descriptive activity names to name the activities in the data set
activity_labels <- read.table("activity_labels.txt")
names(activity_labels) <- c("Activity_ID","Activity")
mean_std_data <- merge(mean_std_data,activity_labels)

## 4.Appropriately label the data set with descriptive variable names.
# Already done above

## 5.From the data set in step 4, create a second, independent tidy data set with the average of each variable for each activity and each subject.
# Split by subject, then take the average for each activity

# Function to get the mean for each column, to be called for multiple columnes in a data frame
lApplyMean <- function(inArr) {
  lapply(inArr,mean)
}

# Drop the named Activity column to allow calculation of averages
mean_std_data$Activity <- NULL
# Clean up tidy_data, since we append data
if (exists("tidy_data")) {remove(tidy_data)}

# Split by subject and activity, compute the average for all measurements, and construct the output array tidy_data
by_subject <- split(mean_std_data,mean_std_data$Subject)
for (subject in names(by_subject)) {
  by_activity <- split(by_subject[[subject]],by_subject[[subject]]$Activity_ID)
  avg_activity <- lapply(by_activity,lApplyMean)
  for (activity in names(avg_activity)) {
    if (!exists("tidy_data")) {tidy_data <- as.data.frame(avg_activity[[activity]])}
    else {tidy_data <- rbind(tidy_data,as.data.frame(avg_activity[[activity]]))}
  }
}

# Add activity names to tidy_data, and reorganize columns for usability
activity_IDs <- tidy_data$Activity_ID
tidy_data <- merge(tidy_data,activity_labels,by.x="Activity_ID",by.y="Activity_ID")
tidy_data$Activity_ID <- NULL

tidy_data <- cbind(tidy_data[1],tidy_data[ncol(tidy_data)],tidy_data[2:(ncol(tidy_data)-1)])

# Write output data
#write.table(tidy_data,file="tidy_data.txt",row.names=FALSE)

