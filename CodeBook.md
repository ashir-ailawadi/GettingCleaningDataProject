# Code book for Coursera *Getting and Cleaning Data* - Course Croject

The data set that this code book pertains to is located in the `tidy_data.csv` file of this repository.

See the `README.md` file of this repository for background information on this data set.

The variables are listed in the [Variables](#variables) section, and the transformations that were carried out to obtain the data set based on the source data are presented in the [Transformations](#transformations) section.

## Variables <a name="variables"></a>

- `subject`
- `activity`
- `timeBodyAccelerometerMeanX`
- `timeBodyAccelerometerMeanY`
- `timeBodyAccelerometerMeanZ`
- `timeBodyAccelerometerStdX`
- `timeBodyAccelerometerStdY`
- `timeBodyAccelerometerStdZ`
- `timeGravityAccelerometerMeanX`
- `timeGravityAccelerometerMeanY`
- `timeGravityAccelerometerMeanZ`
- `timeGravityAccelerometerStdX`
- `timeGravityAccelerometerStdY`
- `timeGravityAccelerometerStdZ`
- `timeBodyAccelerometerJerkMeanX`
- `timeBodyAccelerometerJerkMeanY`
- `timeBodyAccelerometerJerkMeanZ`
- `timeBodyAccelerometerJerkStdX`
- `timeBodyAccelerometerJerkStdY`
- `timeBodyAccelerometerJerkStdZ`
- `timeBodyGyroscopeMeanX`
- `timeBodyGyroscopeMeanY`
- `timeBodyGyroscopeMeanZ`
- `timeBodyGyroscopeStdX`
- `timeBodyGyroscopeStdY`
- `timeBodyGyroscopeStdZ`
- `timeBodyGyroscopeJerkMeanX`
- `timeBodyGyroscopeJerkMeanY`
- `timeBodyGyroscopeJerkMeanZ`
- `timeBodyGyroscopeJerkStdX`
- `timeBodyGyroscopeJerkStdY`
- `timeBodyGyroscopeJerkStdZ`
- `timeBodyAccelerometerMagnitudeMean`
- `timeBodyAccelerometerMagnitudeStd`
- `timeGravityAccelerometerMagnitudeMean`
- `timeGravityAccelerometerMagnitudeStd`
- `timeBodyAccelerometerJerkMagnitudeMean`
- `timeBodyAccelerometerJerkMagnitudeStd`
- `timeBodyGyroscopeMagnitudeMean`
- `timeBodyGyroscopeMagnitudeStd`
- `timeBodyGyroscopeJerkMagnitudeMean`
- `timeBodyGyroscopeJerkMagnitudeStd`
- `frequencyBodyAccelerometerMeanX`
- `frequencyBodyAccelerometerMeanY`
- `frequencyBodyAccelerometerMeanZ`
- `frequencyBodyAccelerometerStdX`
- `frequencyBodyAccelerometerStdY`
- `frequencyBodyAccelerometerStdZ`
- `frequencyBodyAccelerometerJerkMeanX`
- `frequencyBodyAccelerometerJerkMeanY`
- `frequencyBodyAccelerometerJerkMeanZ`
- `frequencyBodyAccelerometerJerkStdX`
- `frequencyBodyAccelerometerJerkStdY`
- `frequencyBodyAccelerometerJerkStdZ`
- `frequencyBodyGyroscopeMeanX`
- `frequencyBodyGyroscopeMeanY`
- `frequencyBodyGyroscopeMeanZ`
- `frequencyBodyGyroscopeStdX`
- `frequencyBodyGyroscopeStdY`
- `frequencyBodyGyroscopeStdZ`
- `frequencyBodyAccelerometerMagnitudeMean`
- `frequencyBodyAccelerometerMagnitudeStd`
- `frequencyBodyAccelerometerJerkMagnitudeMean`
- `frequencyBodyAccelerometerJerkMagnitudeStd`
- `frequencyBodyGyroscopeMagnitudeMean`
- `frequencyBodyGyroscopeMagnitudeStd`
- `frequencyBodyGyroscopeJerkMagnitudeMean`
- `frequencyBodyGyroscopeJerkMagnitudeStd`

## Transformations <a name="transformations"></a>

The zip file containing the source data is located at [https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip).

The following transformations were applied to the source data:

- [x] 1. The training and test sets were merged to create one data set.
- [x] 1. The measurements on the mean and standard deviation (i.e. signals containing the strings `mean` and `std`) were extracted for each measurement, and the others were discarded.
- [x] 1. The activity identifiers (originally coded as integers between 1 and 6) were replaced with descriptive activity names.
- [x] 1. The variable names were replaced with descriptive variable names, using the following set of rules:
	- Special characters (i.e. `(`, `)`, and `-`) were removed
	- The initial `f` and `t` were expanded to `Frequency` and `Domain` respectively.
	- `Acc`, `Gyro`, `Mag`, `Freq`, `mean`, and `std` were replaced with `Accelerometer`, `Gyroscope`, `Magnitude`, `Frequency`, `Mean`, and `Std` respectively.
	- Replaced (supposedly incorrect as per source's `features_info.txt` file) `BodyBody` with `Body`.
- [x] 1. From the data set in step 4, the final data set was created with the average of each variable for each activity and each subject.

The collection of the source data and the transformations listed above were implemented by the `run_analysis.R` R script.
