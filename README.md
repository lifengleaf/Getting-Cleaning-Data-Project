# Course Project for Getting and Cleaning Data

This is the course project repositry for Getting and Cleaning Data in Coursera. The purpose of this project is to read in the ["Human Activity Recognition Using Smartphones"] (http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) data set, perform an analysis on the data set, and create a tidy data set.

Here are steps to work on this project:

1. download the data from [this link] (https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) and save in local drive. You'll have a UCI HAR Dataset folder.
2. Put [run_analysis.R](https://github.com/lifengleaf/Getting-Cleaning-Data-Project/blob/master/run_analysis.R) in the UCI HAR Dataset folder, then set it as your working directory.
3. Run source("run_analysis.R"). It will load and process the data, merge the training and test sets, and create a new dataset [tidy_data.txt] (https://github.com/lifengleaf/Getting-Cleaning-Data-Project/blob/master/tidy_data.txt) in your working directory.

You can read more about the data sets and the analysis methods in the [code book](https://github.com/lifengleaf/Getting-Cleaning-Data-Project/blob/master/code_book.Rmd).
