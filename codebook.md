# CODEBOOK

## Getting and cleaning the data in RStudio's shell

Download the dataset:  
+ Dataset downloaded and unzipped in folder `UCI HAR Dataset`

Assign each data subset to variables:  

+ `features <- features.txt` : 561 rows, 2 columns  
*contains features selected from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ*
+ `activities <- activity_labels.txt` : 6 rows, 2 columns  
*contains list of activities performed, measurements and codes*  
+ `subject_test <- test/subject_test.txt` : 2947 rows, 1 column  
*contains test data of 9/30 test subjects* 
+ `x_test <- test/X_test.txt` : 2947 rows, 561 columns  
*contains recorded features test data* 
+ `y_test <- test/y_test.txt` : 2947 rows, 1 columns  
*contains test data of activities’ code labels*  
+ `subject_train <- test/subject_train.txt` : 7352 rows, 1 column  
*contains train data of 21/30 train subjects*  
+ `x_train <- test/X_train.txt` : 7352 rows, 561 columns  
*contains recorded features train data*  
+ `y_train <- test/y_train.txt` : 7352 rows, 1 columns  
*contains train data of activities’ code labels*  

## Analysing the data

The script `run_analysis.R` performs the 5 tasks required for the assignment.

1. Merges the training and the test sets to create one data set:  
+ `x` (10299 rows, 561 columns) is created by merging `x_train` and `x_test` using `rbind()`   
+ `y` (10299 rows, 1 column) is created by merging `y_train` and `y_test` using `rbind()`   
+ `subject` (10299 rows, 1 column) is created by merging `subject_train` and `subject_test` using `rbind()`   
+ `merged_data` (10299 rows, 563 column) is created by merging `subject`, `y` and `x` using `cbind()`   

2. Extracts only the measurements on the mean and standard deviation for each measurement:  
+ `tidy_data` (10299 rows, 88 columns) is created by subsetting `merged_data`, selecting only columns: `subject`, `code` and the measurements on the `mean` and `standard deviation` for each observation

3. Uses descriptive activity names to name the activities in the data set:  
+ `code` column in the data set is replaced with corresponding activity taken from `activities` column  

4. Appropriately labels the data set with descriptive variable names:  
+ `code` column in `tidy_data` renamed `activities`  
+ variable `Acc` renamed `Accelerometer`  
+ variable `Gyro` renamed `Gyroscope`  
+ variable `BodyBody` renamed `Body`  
+ variable `Mag` renamed `Magnitude`  
+ variable `f` renamed `Frequency`  
+ variable `t` renamed `Time`  

5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject:  
+ `final_data` (180 rows, 88 columns) is created by summarising `tidy_data` taking the means of each variable for each activity and each subject using `summarise_all()`, after grouping them using `group_by()`
+ `final_data` is exported into `FinalData.txt` file.
