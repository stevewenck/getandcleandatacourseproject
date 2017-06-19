# Getting and Cleaning Data Course Project

Repository for the course project for the Johns Hopkins Getting and Cleaning Data course.

## Overview
This project serves to demonstrate the collection and cleaning of data that can be used for subsequent analysis.

A full description of the source data used in this project can be found at [The UCI Machine Learning Repository](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones). [The source data for this project can be found here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip).

## Making Modifications to This Script
Once you have obtained and unzipped the source files, you will need to make a single modification to the R file before you can process the data.
Line 9 of run_analysis.r sets the path of the working directory. You will ned to change this line of code to relect the location of the source files in your own directory.

## Project Summary
The following is a summary of the project instructions:

You should create one R script called run_analysis.r that does the following. 
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject. 

## Additional Information
You can find additional information about the variables, data and transformations in the CodeBook.MD file.