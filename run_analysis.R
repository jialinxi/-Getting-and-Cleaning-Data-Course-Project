Activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt", sep ="")
#Load activity labels into R
Features <- read.table("UCI HAR Dataset/features.txt", sep ="")
#Load features into R

X_test <- read.table("UCI HAR Dataset/test/X_test.txt", sep ="")
Label_test <- read.table("UCI HAR Dataset/test/Y_test.txt", sep ="")
Subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt", sep = "")
#Load all the test data into R

colnames(Subject_test) <- "Subject"
colnames(Label_test) <- "Label"
#Change the column names into more comprehensible names

colnames(X_test) <- Features$V2
#Change the column names of X_test so every measurement has a descriptive name

Label_names <- as.character(Activity_labels$V2)
Label_list <- list()
Function1 <- function(x){
                Label_list[x] <- Label_names[(Label_test$Label[x])]
                }
Labelfullname <- sapply(1:2947, Function1)
#Use apply function to assign each row of X an activity label

X_test_meanstd <- X_test[,grep("mean|std", Features$V2)]
#Use grep function to return the columns of measurements contain either mean or std information

Test <- cbind(Subject_test, Labelfullname, X_test_meanstd)
#Merge x_test, labels and subjects data together

X_train <- read.table("UCI HAR Dataset/train/X_train.txt", sep ="")
Label_train <- read.table("UCI HAR Dataset/train/Y_train.txt", sep ="")
Subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt", sep = "")
colnames(Subject_train) <- "Subject"
colnames(Label_train) <- "Label"
colnames(X_train) <- Features$V2

Function2 <- function(x){
                Label_list[x] <- Label_names[(Label_train$Label[x])]
                }
Labelfullname <- sapply(1:7352, Function2)

X_train_meanstd <- X_train[,grep("mean|std", Features$V2)]

Train <- cbind(Subject_train, Labelfullname, X_train_meanstd)
#Repeat what we did to Test data set with Train data set

OrganizedData <- rbind(Train, Test)
library(plyr)
OrganizedData <- arrange(OrganizedData, Subject)
#Merge train set and Test set, then sort based on ascending order of subject

library(reshape2)
Data_labels <- colnames(OrganizedData)[3:81]
Data_melt <- melt(OrganizedData, id = c("Subject", "Labelfullname"), measure.vars = Data_labels)
tidy_data <- dcast(Data_melt, Subject + Labelfullname ~ variable, mean)
#From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject

write.table(tidy_data, file = "./tidy_data.txt")
#Write tidy_data as txt file
