## Getting and Cleaning Data, Course Project

#### run_analysis.R
#### Function by David Tomashek.
#### Package built to meet requirements of course project for Coursera Data Science program, Getting and Cleaning Data Course, August 2014.
#### Jeff Leek, Instructor

#### The function assumes the user has already downloaded the UCI HAR Dataset to a folder in the working directory

### The run_analysis() function does the following steps:

* from test/X_test, reads observation data for test partition
* from test/subject.txt, adds subject column to observation variables for test
* from test/y_test.txt, adds activity column to observation variables for test
* from train/X_train, reads observation data for training partition
* from train/subject.txt, adds subject column to observation variables for training
* from train/y_train.txt, adds activity column to observation variables for training
* creates a dataset that is a union of test and training partitions
* from activity_labels.txt, use merge to add column of activity labels to observation variables
* changes observation variable dimension headers to feature names from feature.txt
* create a data frame that is subset with only columns that have mean or standard deviation
* create aggregated result set that gives the mean of all observation variables for subject and activity
* write results to file named AveragesBySubjectActivity.txt