#CodeBook
This code book discribes the data, variables and the procedures taken to produce tidy data.

##The data source

Original data: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
Original description of the dataset: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

##The data
The dataset includes the following files:

* "README.txt"
* "features_info.txt": Contains information about the variables used on the feature vector.
* "features.txt": List of all measurement/features.
* "activity_labels.txt": Links the class labels with their activity name.
* "train/subject_train.txt": Train subject label
* "train/X_train.txt": Training data set.
* "train/y_train.txt": Training labels.
* "test/subject_test.txt": Test subject label.
* "test/X_test.txt": Test data set.
* "test/y_test.txt": Test labels.

##Transformation details

* Load reshapre2 and data.table libraries (pre-installation of these packages are needed).
* Load the features and activity labels.
* Load test, train and subject data (column names for test data are loaded as feature names from previous step)
* Merge data set.
* Extract the mean and standard deviation column names and data.
* Replace activity class label with activity description. 
* Produce final data by computing mean of all measurement by subject and activity label.
