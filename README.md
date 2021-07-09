# Getting and Cleaning Data - Course Project

This is the course project for the Getting and Cleaning Data Coursera course.
The R script, `run_analysis.R`, does the following:

1. Downloads and Unzips the data-sets
2. Loads training and test data-sets, activity & subject data for each data-set and activity and feature information
3. Adds the `subject` and `activity` to the test/train data-sets and binds the 2 data-sets together into a single data-set
4. Keeps only those columns which reflect a mean or standard deviation
5. Converts the `activity` columns into factors using descriptive activity names
6. Sets meaningful variable names
7. Creates a tidy dataset that consists of the average (mean) value of each variable for each subject and activity pair.

The end result is shown in the file `tidy_data.csv`.
