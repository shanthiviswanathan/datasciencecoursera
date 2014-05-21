# Getting and Cleaning Data Project
# Shanthi Viswanathan
#
#!!! Setup: Set working directory to current location of this script.
#!!!        Download data from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
#!!!        Unzip the downloaded file in the same directory as this script.

# Package Check and Install
pkg <- "reshape2"
if (!require(pkg, character.only = TRUE)) {
  install.packages(pkg)
  if (!require(pkg, character.only = TRUE)) 
    stop(paste("Load failure: ", pkg))
}


# Data Directories
testDirectory <- "./test/"
trainDirectory <- "./train/"

message("Importing meta data...")
activities <- read.table("./activity_labels.txt", header=FALSE, stringsAsFactors=FALSE)
features <- read.table("./features.txt", header=FALSE, stringsAsFactors=FALSE)
message("Importing meta data. DONE.")

# Test Data Import & Prepare
message("Importing and preparing Test data...")
subject_test <- read.table(paste0(testDirectory, "subject_test.txt"), header=FALSE)
x_test <- read.table(paste0(testDirectory, "X_test.txt"), header=FALSE)
y_test <- read.table(paste0(testDirectory, "y_test.txt"), header=FALSE)

# Set "activities" as labels for the levels in y_test
tmp <- data.frame(Activity = factor(y_test$V1, labels = activities$V2))
# Create a new testData dataframe by binding Activity, Subject and x_test observations.
testData <- cbind(tmp, subject_test, x_test)
message("Importing and preparing Test data. DONE.")

# Train Data Import & Prepare
message("Importing and preparing Train data...")
subject_train <- read.table(paste0(trainDirectory, "subject_train.txt"), header=FALSE)
x_train <- read.table(paste0(trainDirectory, "X_train.txt"), header=FALSE)
y_train <- read.table(paste0(trainDirectory, "y_train.txt"), header=FALSE)

# Set "activities" as labels for the levels in y_test
tmp <- data.frame(Activity = factor(y_train$V1, labels = activities$V2))
# Create a new trainData dataframe by binding Activity, Subject and x_train observations.
trainData <- cbind(tmp, subject_train, x_train)
message("Importing and preparing Train data. DONE.")

# Tidy Data
message("Preparing Tidy Data from mean and std data...")
#Combine Train and Test Data
tmpTidyData <- rbind(testData, trainData)
#Set Column Names to the combined data
names(tmpTidyData) <- c("Activity", "Subject", features[,2])
#Create a vector with columns that include either mean or standard deviation in the feature's data frame column V2
select <- features$V2[grep("mean|std", features$V2)]
#Extract Activity, Subject and the columns selected above
tidyData <- tmpTidyData[c("Activity", "Subject", select)]
message("Preparing Tidy Data from mean() and std() data. DONE.")

# Write Tidy Data to Disk
message("Writing Tidy Data to disk in tidyData.txt...")
write.table(tidyData, file="./tidyData.txt", row.names=FALSE)
message("Writing Tidy Data to disk in tidyData.txt. DONE.")

# Tidy Data Average for each Activity/Subject. Melt and Cast.
message("Preparing Tidy Average Data per Activity...")
tidyDataMelt <- melt(tidyData, id=c("Activity", "Subject"), na.rm=TRUE, measure.vars=select)
tidyDataMean <- dcast(tidyDataMelt, Activity + Subject ~ variable, mean)
message("Preparing Tidy Average Data per Activity/Subject. DONE.")

# Write Tidy Average Data
message("Writing Tidy Average Data to tidyAvgData.txt...")
write.table(tidyDataMean, file="./tidyAvgData.txt", row.names=FALSE)
message("Writing Tidy Average Data to tidyAvgData.txt. DONE.")

