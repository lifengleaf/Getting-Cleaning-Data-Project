# Course Project for Getting and Cleaning Data

This is the course project repositry for Getting and Cleaning Data in Coursera. The purpose of this project is to read in the "Human Activity Recognition Using Smartphones" <http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones> data set, perform an analysis on the data set, and create a tidy data set.

Here are steps to work on this project:

1. download the data from this link <https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip> and save in local drive. You'll have a UCI HAR Dataset folder.
2. Put run_analysis.R in the parent folder of UCI HAR Dataset, then set it as your working directory using setwd() function.
3. Run source("run_analysis.R"). It will merge the training and test sets, and creat an independent dataset with the average of measurements of each variable for each activity and each subject.
4. The result is a new file tiny_data.txt in your working directory.

You can read more about the data sets and the analysis methods in the code book.
