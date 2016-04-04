# Code Book
## Source Data
Details about the original source data are available on the [UCI Machine Learning Repository website](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).

## Data Set Information
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. 

For each record in the original data set, the following is provided:  
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.  
- Triaxial Angular velocity from the gyroscope.  
- A 561-feature vector with time and frequency domain variables.  
- Its activity label.  
- An identifier of the subject who carried out the experiment. 

## Data Set Manipulation
Changes to the data set occurred through five major steps:  
1. Using a combination of `cbind()` and `rbind()`, I merged the training and the test sets to create one data set.  
2. `cbind()`, `grep()`, and `gsub()` were used to extract only the measurements on the mean and standard deviation for each measurement.  
3. Descriptive activity names were added to name the activities in the data set by using the `levels` and `labels` arguments of `factor()`.  
4. I was able to appropriately label the data set with descriptive variable names using `names()`.  
5. From the data set in step 4, a second, independent tidy data set was created using `melt()` and `dcast()`.  This data set contains the average of each variable for each activity and each subject.  

## Identifying fields
* `Subject` - An identifier of the subject who carried out the experiment ("participant").
* `Activity` - An identifier of activities which were measured.

## Measurements
* `tBodyAccMeanX`
* `tBodyAccMeanY`
* `tBodyAccMeanZ`
* `tBodyAccStdX`
* `tBodyAccStdY`
* `tBodyAccStdZ`
* `tGravityAccMeanX`
* `tGravityAccMeanY`
* `tGravityAccMeanZ`
* `tGravityAccStdX`
* `tGravityAccStdY`
* `tGravityAccStdZ`
* `tBodyAccJerkMeanX`
* `tBodyAccJerkMeanY`
* `tBodyAccJerkMeanZ`
* `tBodyAccJerkStdX`
* `tBodyAccJerkStdY`
* `tBodyAccJerkStdZ`
* `tBodyGyroMeanX`
* `tBodyGyroMeanY`
* `tBodyGyroMeanZ`
* `tBodyGyroStdX`
* `tBodyGyroStdY`
* `tBodyGyroStdZ`
* `tBodyGyroJerkMeanX`
* `tBodyGyroJerkMeanY`
* `tBodyGyroJerkMeanZ`
* `tBodyGyroJerkStdX`
* `tBodyGyroJerkStdY`
* `tBodyGyroJerkStdZ`
* `tBodyAccMagMean`
* `tBodyAccMagStd`
* `tGravityAccMagMean`
* `tGravityAccMagStd`
* `tBodyAccJerkMagMean`
* `tBodyAccJerkMagStd`
* `tBodyGyroMagMean`
* `tBodyGyroMagStd`
* `tBodyGyroJerkMagMean`
* `tBodyGyroJerkMagStd`
* `fBodyAccMeanX`
* `fBodyAccMeanY`
* `fBodyAccMeanZ`
* `fBodyAccStdX`
* `fBodyAccStdY`
* `fBodyAccStdZ`
* `fBodyAccJerkMeanX`
* `fBodyAccJerkMeanY`
* `fBodyAccJerkMeanZ`
* `fBodyAccJerkStdX`
* `fBodyAccJerkStdY`
* `fBodyAccJerkStdZ`
* `fBodyGyroMeanX`
* `fBodyGyroMeanY`
* `fBodyGyroMeanZ`
* `fBodyGyroStdX`
* `fBodyGyroStdY`
* `fBodyGyroStdZ`
* `fBodyAccMagMean`
* `fBodyAccMagStd`
* `fBodyBodyAccJerkMagMean`
* `fBodyBodyAccJerkMagStd`
* `fBodyBodyGyroMagMean`
* `fBodyBodyGyroMagStd`
* `fBodyBodyGyroJerkMagMean`
* `fBodyBodyGyroJerkMagStd`

## Activity Labels

* `WALKING` (value `1`)
* `WALKING_UPSTAIRS` (value `2`)
* `WALKING_DOWNSTAIRS` (value `3`)
* `SITTING` (value `4`)
* `STANDING` (value `5`)
* `LAYING` (value `6`)

## Variables and Summaries
* `packages` was a character vector used to store a list of potentially useful libraries.  
* `zipfile` and `datafolder` were character vectors used to assist in downloading the data set.  
* `meta_activity_labels` stored activity_labels.txt, `meta_features` stored features.txt, `test_set` stored X_test.txt, `test_labels` stored Y_test.txt, `test_subject` stored subject_test.txt, `train_set` stored X_train.txt, `train_labels` stored Y_train.txt, and `train_subject` stored subject_train.txt.  
* `test_merged` stored a data frame of all test data, `train_merged` stored a data frame of all training data, and `all_merged` stored a data frame of all data.  
* `mean_and_std` stored a subset of all data, focused on the mean and standard deviation measurements.  
* `final_data_set` stored the final data set, which was a mean of all columns related to a unique subject and activity pair.  


## Final output
The final result of my manipulation is in the file `project.txt`.
