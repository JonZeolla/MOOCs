####################
#
# File name:  run_analysis.R
# Author:     Jon Zeolla
#
####################

## Environment set-up
# TODO: Don't forget to set your wd via setwd() to the folder with the dataset
# setwd("/Users/jzeolla/Documents/MOOC/CleaningData/week4")
# Load a general set of helpful libraries
packages <- c("lubridate", "reshape2", "plyr", "dplyr", "tidyr")
sapply(packages, require, character.only = TRUE)

## Download and unzip the data
zipfile <- "UCI_HAR_Dataset.zip"
datafolder <- "UCI HAR Dataset"
if(!file.exists(zipfile)) {download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", zipfile, method = "curl")}
if(!file.exists(datafolder)) {unzip(zipfile);setwd("UCI HAR Dataset")} else {setwd("UCI HAR Dataset")}

## Read in the data
# Read meta files
meta_activity_labels <- read.table("activity_labels.txt")
meta_features <- read.table("features.txt")
# Read test files
test_set <- read.table("test/X_test.txt")
test_labels <- read.table("test/Y_test.txt")
test_subject <- read.table("test/subject_test.txt")
# Read train files
train_set <- read.table("train/X_train.txt")
train_labels <- read.table("train/Y_train.txt")
train_subject <- read.table("train/subject_train.txt")

## Step 3:  Use descriptive activity names to name the activities in the data
# set.
# Set meta column names
names(meta_activity_labels) <- c("label","activity")
names(meta_features) <- c("label","feature")
# Set test column names
names(test_subject) <- c("subject")
names(test_set) <- meta_features[,2]
names(test_labels) <- c("activity")
# Set train column names
names(train_subject) <- c("subject")
names(train_set) <- meta_features[,2]
names(train_labels) <- c("activity")

## Step 1:  Merge the training and the test sets to create one data set.
test_merged <- cbind(test_subject, test_labels, test_set)
train_merged <- cbind(train_subject, train_labels, train_set)
all_merged <- rbind(test_merged, train_merged)

## Step 2:  Extract only the measurements on the mean and standard deviation for
## each measurement.
# mean_and_std <- all_merged[, grep(c("std\\(\\)|mean\\(\\)"), names(all_merged))]
# If you'd like to have a data frame that includes the subject and activity fields
mean_and_std <- cbind(all_merged$subject, all_merged$activity, all_merged[, grep(c("std\\(\\)|mean\\(\\)"), names(all_merged))])
colnames(mean_and_std)[colnames(mean_and_std)=="all_merged$subject"] <- "Subject"
colnames(mean_and_std)[colnames(mean_and_std)=="all_merged$activity"] <- "Activity"
mean_and_std$Activity <- as.character(mean_and_std$Activity)

## Step 4:  Appropriately label the data set with descriptive variable names.
names(mean_and_std) <- gsub('mean', 'Mean', names(mean_and_std))
names(mean_and_std) <- gsub('std', 'Std', names(mean_and_std))
names(mean_and_std) <- gsub('-', '', names(mean_and_std))
names(mean_and_std) <- gsub('\\(\\)', '', names(mean_and_std))

## Step 5:  From the data set in step 4, create a second, independent tidy data
## set with the average of each variable for each activity and each subject.
# Duplicate the data in a new data frame before manipulating it
final_data_set <- mean_and_std
final_data_set$Activity <- factor(final_data_set$Activity, levels = meta_activity_labels$label, labels = meta_activity_labels$activity)
final_data_set$Subject <- as.factor(final_data_set$Subject)
# Get a nice, tall and skinny data set
final_data_set <- melt(final_data_set, id = c("Subject", "Activity"))
final_data_set <- dcast(final_data_set, Subject + Activity ~ variable, mean)
# Write it out
write.table(final_data_set, "project.txt", row.names = FALSE, quote = FALSE)
