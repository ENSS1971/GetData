---
title: "Getting and Cleaning Data in R"
author: "Sepulveda, Eduardo"
date: "2023-09-22"
output: html_document
---

The aim of the project is to clean and extract usable data from the above zip file. R script called run_analysis.R that does the following: - Merges the training and the test sets to create one data set. - Extracts only the measurements on the mean and standard deviation for each measurement. - Uses descriptive activity names to name the activities in the data set - Appropriately labels the data set with descriptive variable names. - From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.


#### In this project, you find:

---

|     Files     |                        Description                              |
|:---           | ---:                                                            |
|run_analysis.R | the R-code run on the data set                                  |
|TidyData.txt   | the clean data extracted the original data using run_analysis.R |
|CodeBook.md    | the CodeBook reference to the variables in TidyData.txt         |
|REDAME.md      | the analysis of the code in run_analysis.R                      |

---

You should create one R script called run_analysis.R that does the following.

1. Merges the training and the test sets to create one data set.
    * 1.1 Reading files.
      * 1.1.1 - Reading trainings tables
      * 1.1.2 - Reading testing tables
      * 1.1.3 - Reading feature vector
      * 1.1.4 - Reading activity labels
    * 1.2 - Combining respective data into training and testing data sets corresponding
    * 1.3 - Naming the columns
    * 1.4 - Merge the data
<br/>
2. Extracts only the measurements on the mean and standard deviation for each measurement.
    * 2.1 - Create vector for defining mean and standard deviation
    * 2.2 - Adding columns to the list
    * 2.3 - Define the variable
<br/>
3. Uses descriptive activity names to name the activities in the data set
<br/>
4. Appropriately labels the data set with descriptive variable names.
    * 4.1 - Replacing the following acronyms
<br/>
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
    * 5.1 - Define the factorial variable
    * 5.2 - Creating a data set with averages for each activity and subject.
    * 5.3 - writing the TidyData.txt data file that contains the processed data
    

<br/>

* A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

* Here are the data for the project:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip


List of the original data sets inside the downloaded zip file:

    * 'README.txt': describes about the general information and background related to the data sets within the zip file.
    * 'features_info.txt': Shows information about the variables used on the feature vector.
    * 'features.txt': List of all features.
    * 'activity_labels.txt': Links the class labels with their activity name.
    * 'train/X_train.txt': Training set.
    * 'train/y_train.txt': Training labels.
    * 'test/X_test.txt': Test set.
    * 'test/y_test.txt': Test labels.


Appropriately labels the data set with descriptive variable names
code column in TidyData renamed into activities

    * All Acc in column’s name replaced by Accelerometer
    * All Gyro in column’s name replaced by Gyroscope
    * All BodyBody in column’s name replaced by Body
    * All Mag in column’s name replaced by Magnitude
    * All start with character f in column’s name replaced by Frequency
    * All start with character t in column’s name replaced by Time

**Naming the variables**  
features - features.txt  
activityLabels - activity_labels.txt  

subjectTrain  - subject_train.txt  
activityTrain - y_train.txt  
featuresTrain - X_train.txt  

subjectTest  - subject_test.txt  
activiyTest  - y_test.txt  
featuresTest - X_test  

**The respective data in trainig and test data sets corresponding**  
subject  
activity  
features  

**Named features data set from metadada in**  
featureNames  

**Creates a second data set**  
tidyData  

**features, activity and subject are merged**  
completeData  

**The measurements on mean and standart**  
columnsWithMeansSTD  
extractData  
requiredColumns  

**Write it into data file "TidyData.txt" that contains the processed data.**  
TidyData.txt  


#### This repository is a *Eduardo Sepulveda* submission for Getting and Cleaning Data course project. It has the instructions on how to run analysis on Human Activity recognition dataset.
