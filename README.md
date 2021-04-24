# Coursera - Getting and Cleaning Data
## Peer-graded Assignment, Week 4

*This repository contains my personal submission for the assignment mentioned above.*  
*This README contains a description of the repository's content.*

### Human Activity Recognition Using Smartphones

[Dataset - Human Activity Recognition Using Smartphones](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

Authors: Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

Files:  

`codebook.md` - a code book that describes variables, data and processes performed to prepare, clean up and analyse the data.

`run_analysis.R` - performs the tasks for the assignment as follows:
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

`FinalData.txt` - exported final data in text format, as a result of the tasks mentioned above.
