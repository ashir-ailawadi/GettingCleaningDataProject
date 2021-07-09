#---------------------
#1. Loading Libraries
#---------------------
library(dplyr)

#----------------------------------
#2. Download the Dataset and Unzip
#----------------------------------
if (!file.exists("./Dataset")) {
  dir.create("./Dataset")
}
setwd("./Dataset")
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip" , "dataset.zip")
unzip("dataset.zip")
setwd("./UCI HAR Dataset")

#--------------------------------
#3. Reading the data from files
#--------------------------------

# Test Data
x_test <- read.table(".\\test\\X_test.txt")

# Train Data
x_train <- read.table(".\\train\\X_train.txt")

# Activity List for Test Data
y_test <- read.table(".\\test\\Y_test.txt")

# Activity List for Train Data
y_train <- read.table(".\\train\\Y_train.txt")

# Subjects for Test Data
subject_test <- read.table(".\\test\\subject_test.txt")

# Subjects for Train Data
subject_train <- read.table(".\\train\\subject_train.txt")

# List of all features
features <- read.table("features.txt")

# Activity descriptions
activity_labels <- read.table("activity_labels.txt")

#--------------------------------------------------------------------------------------
#4. Adding the subject and activity to the Test/Train data and binding them together
#--------------------------------------------------------------------------------------

# Adding the subject and activity
x_test <- mutate(x_test, subject=subject_test[,1], activity=y_test[,1], .before=1)
x_train <- mutate(x_train, subject=subject_train[,1], activity=y_train[,1], .before=1)

# Binding Test and Train data
data <- rbind (x_test , x_train)

# Setting variable names
names(data) <- c("subject","activity",features[,2])

#----------------------------------------
#5. Extracting only mean & std variables
#----------------------------------------
data <- data[,c(1,2,grep("-mean\\(\\)|-std\\(\\)",names(data)))]

#------------------------------------
#6. Using descriptive activity names
#------------------------------------
data <- mutate (data,activity=factor(activity,labels=activity_labels[,2]))


#------------------------------------
#7. Setting meaningful variable names
#------------------------------------
names(data)<-gsub("^t", "time", names(data))
names(data)<-gsub("^f", "frequency", names(data))
names(data)<-gsub("Acc", "Accelerometer", names(data))
names(data)<-gsub("Gyro", "Gyroscope", names(data))
names(data)<-gsub("Mag", "Magnitude", names(data))
names(data)<-gsub("BodyBody", "Body", names(data))
names(data)<-gsub("-mean\\(\\)[-]?", "Mean", names(data))
names(data)<-gsub("-std\\(\\)[-]?", "Std", names(data))

#-------------------------------------------------------------------------------------------------------
#8. Creating independent tidy dataset with average of each variable for each activity and each subject
#-------------------------------------------------------------------------------------------------------
tidy_data <- data %>% group_by(subject,activity) %>% summarize_all(mean)

#------------------------------
#9. Writing csv
#------------------------------
setwd("../..")
write.csv(tidy_data,"tidy_data.csv")