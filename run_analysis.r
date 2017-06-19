## Data Science Course 3 - Course Project
## Getting and Cleaning Data
## Steve Wenck
## June 19, 2017

## This program merges the activity labels, features, training, and testing datasets and creates a tidy dataset

## Change working directory
setwd("~/R/Coursera/Data Science/Course 3/Project")

## Load reshapre2 package (melting and casting)
library(reshape2)

## Read Activity Labels data
activityLabels <- read.table("activity_labels.txt")
activityLabels[,2] <- as.character(activityLabels[,2])

## Load Features data
features <- read.table("features.txt")
features[,2] <- as.character(features[,2])

## Read the Training data
train <- read.table("train/X_train.txt")[featuresWanted]
trainActivities <- read.table("train/Y_train.txt")
trainSubjects <- read.table("train/subject_train.txt")
train <- cbind(trainSubjects, trainActivities, train)

## Read the Testing data
test <- read.table("test/X_test.txt")[featuresWanted]
testActivities <- read.table("test/Y_test.txt")
testSubjects <- read.table("test/subject_test.txt")
test <- cbind(testSubjects, testActivities, test)

## Extract only the Features data on mean and standard deviation
featuresWanted <- grep(".*mean.*|.*std.*", features[,2])
featuresWanted.names <- features[featuresWanted,2]
featuresWanted.names = gsub('-mean', 'Mean', featuresWanted.names)
featuresWanted.names = gsub('-std', 'Std', featuresWanted.names)
featuresWanted.names <- gsub('[-()]', '', featuresWanted.names)

## Merge the Training and Testing datasets for the wanted feature names
allData <- rbind(train, test)
colnames(allData) <- c("subject", "activity", featuresWanted.names)

## Convert activities into factors
allData$activity <- factor(allData$activity, levels = activityLabels[,1], labels = activityLabels[,2])
allData$subject <- as.factor(allData$subject)

## Reshape data into tidy format
allData.melted <- melt(allData, id = c("subject", "activity"))
allData.mean <- dcast(allData.melted, subject + activity ~ variable, mean)

## Write tidy data to a text file
write.table(allData.mean, "tidy.txt", row.names = FALSE, quote = FALSE)