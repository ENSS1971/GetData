##Getting and Cleaning Data Course Project##

#Loading required packages
library(dplyr)
library(data.table)

#Checking if folder exists
if(!file.exists("./data")){dir.create("./data")}

#Get data from zip file
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl, destfile = "./data/data.zip", method = "curl")

#Unzipping the file
unzip(zipfile = "./data/data.zip",
      exdir = "./data", 
      overwrite = T)

#_______________________________________________________________________
##Step 1: Merges the training and the test sets to create one data set.
#_______________________________________________________________________

  #1.1 Reading files

    #Step 1.1.1 - Reading trainings tables:
subjectTrain <- read.table("./data/UCI HAR Dataset/train/subject_train.txt", header = FALSE)
activityTrain <- read.table("./data/UCI HAR Dataset/train/y_train.txt", header = FALSE)
featuresTrain <- read.table("./data/UCI HAR Dataset/train/X_train.txt", header = FALSE)

    #Step 1.1.2 - Reading testing tables:
subjectTest <- read.table("./data/UCI HAR Dataset/test/subject_test.txt", header = FALSE)
activityTest <- read.table("./data/UCI HAR Dataset/test/y_test.txt", header = FALSE)
featuresTest <- read.table("./data/UCI HAR Dataset/test/x_test.txt", header = FALSE)

    #Step 1.1.3 - Reading feature vector:
featuresNames <- read.table("./data/UCI HAR Dataset/features.txt")

    #Step 1.1.4 - Reading activity labels:
activityLabels <- read.table("./data/UCI HAR Dataset/activity_labels.txt", header = FALSE)

  #1.2 - Combining respective data into training and testing data sets corresponding
  #to subject, activity and features
subject  <- rbind(subjectTrain, subjectTest)
activity <- rbind(activityTrain, activityTest)
features <- rbind(featuresTrain, featuresTest)

  #1.3 - Naming the columns
colnames(features) <- t(featuresNames[2])

  #1.4 - Merge the data
colnames(activity) <- "Activity"
colnames(subject)  <- "Subject"
completeData <- cbind(features, activity, subject)

#View(completeData)

#_____________________________________________________________________________
#Step 2.-Extracts only the measurements on the mean and standard
#deviation for each measurement.
#_____________________________________________________________________________

  #2.1 - Create vector for defining mean and standard deviation:
columnsWithMeanSTD <- grep(".*Mean.*|.*Std.*", names(completeData), ignore.case = TRUE)

View(columnsWithMeanSTD)

  #2.2 - Adding columns to the list
requiredColumns <- c(columnsWithMeanSTD, 562, 563)

dim(completeData)

  #2.3 - Define the variable
extractedData <- completeData[ ,requiredColumns]
dim(extractedData)

#____________________________________________________
#Step 3. Uses descriptive activity names to name the
#activities in the data set
#____________________________________________________

extractedData$Activity <- as.character(extractedData$Activity)
for (i in 1:6) {
  extractedData$Activity[extractedData$Activity == i] <- as.character(activityLabels[i, 2])
}

extractedData$Activity <- as.factor(extractedData$Activity)

#__________________________________________________________________________
#Step 4. Appropriately labels the data set with descriptive variable names.
#__________________________________________________________________________

names(extractedData)

  #4.1 - Replacing the following acronyms
names(extractedData) <- gsub("Acc", "Accelerometer", names(extractedData))
names(extractedData) <- gsub("Gyro", "Gyroscope", names(extractedData))
names(extractedData) <- gsub("BodyBody", "Body", names(extractedData))
names(extractedData) <- gsub("Mag", "Magnitude", names(extractedData))
names(extractedData) <- gsub("^t", "Time", names(extractedData))
names(extractedData) <- gsub("^f", "Frequency", names(extractedData))
names(extractedData) <- gsub("tBody", "TimeBody", names(extractedData))
names(extractedData) <- gsub("-mean", "Mean", names(extractedData), ignore.case = TRUE)
names(extractedData) <- gsub("-std", "STD", names(extractedData), ignore.case = TRUE)
names(extractedData) <- gsub("-freq()", "Frequency", names(extractedData), ignore.case = TRUE)
names(extractedData) <- gsub("angle", "Angle", names(extractedData))
names(extractedData) <- gsub("gravity", "Gravity", names(extractedData))

names(extractedData)

#__________________________________________________________________________
#Step 5. From the data set in step 4, creates a second,
#independent tidy data set with the average of each variable
#for each activity and each subject.
#__________________________________________________________________________

  #5.1 - Define the factorial variable
extractedData$Subject <- as.factor(extractedData$Subject)
extractedData <- data.table(extractedData)

  #5.2 - Creating a data set with averages for each activity and subject.
tidyData <- aggregate(.~Subject + Activity, extractedData, mean)
tidyData <- tidyData[order(tidyData$Subject, tidyData$Activity),]

#View(tidyData)

  #5.3 - writing the TidyData.txt data file that contains the processed data
write.table(tidyData, file = "TidyData.txt", row.names = FALSE)
