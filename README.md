# Getting-and-Cleaning-Data-Course-Project
Peer-reviewed project for Coursera 
##  The R script - run_analysis.R does the following analysis for you:

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set.
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## User Instructions:
1. Download required data from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip, Unzip the file to your local drive and you will have a folder ```UCI HAR Dataset```.
2. Detailed description of the data can be downloaded from http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
3. Put ```run_analysis.R``` in the parental directory of ```UCI HAR Dataset```, and set the parental directory as your working directory in R.
4. The ```run-analysis.R``` will generate a ```tidy_data.txt```file in the working directory.
5. The ```run_analysis.R``` will automatically load ```reshape2```, so make sure you install this package first.


