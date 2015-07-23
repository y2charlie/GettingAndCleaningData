library(data.table)
library(reshape2)

#Step 0; read data and metadata files
columnNameDescription <- read.table("features.txt", header=F, as.is=T, col.names=c("ID", "Name"))
activity_labels <- read.table("activity_labels.txt", col.names=c("ID","Label"))

#Step 4: Appropriately labels the data set with descriptive variable names.
#read test data
subject_test <- read.table("test/subject_test.txt", col.names="Subject")
X_test <- read.table("test/X_test.txt", col.names=columnNameDescription$Name)
y_test <- read.table("test/y_test.txt", col.names="ActivityLabel")

#read train data
subject_train <- read.table("train/subject_train.txt", col.names="Subject")
X_train <- read.table("train/X_train.txt", col.names=columnNameDescription$Name)
y_train <- read.table("train/y_train.txt", col.names="ActivityLabel")


#Step 1: Merges the training and the test sets to create one data set.
testData<-cbind(subject_test,y_test)
testData<-cbind(testData,X_test)
trainData<-cbind(subject_train,y_train)
trainData<-cbind(trainData,X_train)
completeData<-rbind(testData,trainData)

#Step 2: Extracts only the measurements on the mean and standard deviation for each measurement. 
mean_sd_cols <- grep(".*mean\\(\\)|.*std\\(\\)", columnNameDescription$Name)
subset_data <- completeData[,mean_sd_cols] 

#step 3: Uses descriptive activity names to name the activities in the data set
subset_data$ActivityLabel <- factor(subset_data$ActivityLabel, levels=c(1,2,3,4,5,6), labels=activity_labels$Label)

#step 5: From the data set in step 4, creates a second, independent tidy data set with the average 
#  of each variable for each activity and each subject.
preSummaryData <- data.table(subset_data)
byColumnNames = c("ActivityLabel", "Subject")
measurementVariables = setdiff(colnames(subset_data), byColumnNames)
meltedData <- melt(preSummaryData, id=byColumnNames, measure.vars=measurementVariables)
aggregatedData <- aggregate(meltedData, list(Subject=meltedData$Subject, ActivityLabel = meltedData$ActivityLabel, Variable = meltedData$variable), mean)
aggregatedData <- aggregatedData[,-c(4:6)]
finalData <-spread(aggregatedData, Variable, value)
finalData[order(finalData$Subject, finalData$ActivityLabel),]
write.table(unique(finalData), "TidyData.txt", row.names = F)

