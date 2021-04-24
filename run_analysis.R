## This is the R script for Getting and Cleaning Data - Week 4 Assignment

## Author: Giulia Cauli
## giulia.cauli@studium.uni-hamburg.de
## Version 20210424, Apr. 24th 2021

library(dplyr)

filename <- "GettingCleaningData_Final_Data.zip"

## Checking if archive exists
if (!file.exists(filename)){
      fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
      download.file(fileURL, filename, method="curl")
}  

## Checking if folder exists, else unzipping it
if (!file.exists("UCI HAR Dataset")) { 
      unzip(filename) 
}

## Storing each data subset in a new variable
features <- read.table("UCI HAR Dataset/features.txt", col.names = c("n","functions"))
activities <- read.table("UCI HAR Dataset/activity_labels.txt", col.names = c("code", "activity"))
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt", col.names = "subject")
x_test <- read.table("UCI HAR Dataset/test/X_test.txt", col.names = features$functions)
y_test <- read.table("UCI HAR Dataset/test/y_test.txt", col.names = "code")
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt", col.names = "subject")
x_train <- read.table("UCI HAR Dataset/train/X_train.txt", col.names = features$functions)
y_train <- read.table("UCI HAR Dataset/train/y_train.txt", col.names = "code")

## Merging the training and test sets together
x <- rbind(x_train, x_test)
y <- rbind(y_train, y_test)
subject <- rbind(subject_train, subject_test)
merged_data <- cbind(subject, y, x)

## Extracting mean and standard deviation from data set
tidy_data <- merged_data %>% select(subject, code, contains("mean"), contains("std"))

## Using descriptive activity names
tidy_data$code <- activities[tidy_data$code, 2]

## Labeling variables in data set with descriptive names
names(tidy_data)[2] = "activity"
names(tidy_data)<-gsub("Acc", "Accelerometer", names(tidy_data))
names(tidy_data)<-gsub("Gyro", "Gyroscope", names(tidy_data))
names(tidy_data)<-gsub("BodyBody", "Body", names(tidy_data))
names(tidy_data)<-gsub("Mag", "Magnitude", names(tidy_data))
names(tidy_data)<-gsub("^t", "Time", names(tidy_data))
names(tidy_data)<-gsub("^f", "Frequency", names(tidy_data))
names(tidy_data)<-gsub("tBody", "TimeBody", names(tidy_data))
names(tidy_data)<-gsub("-mean()", "Mean", names(tidy_data), ignore.case = TRUE)
names(tidy_data)<-gsub("-std()", "StandardDeviation", names(tidy_data), ignore.case = TRUE)
names(tidy_data)<-gsub("-freq()", "Frequency", names(tidy_data), ignore.case = TRUE)
names(tidy_data)<-gsub("angle", "Angle", names(tidy_data))
names(tidy_data)<-gsub("gravity", "Gravity", names(tidy_data))

## Creating second, independent data set with the average of each variable for each activity and each subject
final_data <- tidy_data %>%
      group_by(subject, activity) %>%
      summarise_all(list(mean))

## Creating .txt file containing the data set
write.table(final_data, "FinalData.txt", row.name=FALSE)
