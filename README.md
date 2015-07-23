# Getting and Cleaning Data
##Summary
<br>This repository contains "run_analysis.R" which performs the following:</br>
<br>1. Merges the training and the test sets to create one data set.</br>
<br>2. Extracts only the measurements on the mean and standard deviation for each measurement.<br>
<br>3. Uses descriptive activity names to name the activities in the data set.<br>
<br>4. Appropriately labels the data set with descriptive variable names.<br> 
<br>5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.<br>

##Steps to run the script
<br>1. Download data from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip.</br>
<br>2. Unzip the data to the root of RStudio working directory.<br>
<br>3. Download "run_analysis.R" to the root of RStudio working directory.<br>
<br>4. Run source("run_analysis.R"), then it will generate a new file TidyData.txt in your working directory.<br> 
