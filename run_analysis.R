## Programming assignment 
## Week 3: Getting and Cleaning Data
## Santiago Armida, 2015-04-26
## 
## run_analysis.R.
## Takes two files: test x and train x   marges the files together 
##  Starts in directory UCI HAR Dataset
trainDF = read.table("./train/X_train.txt", header = FALSE, sep = "")
trainSub <- read.table("./train/subject_train.txt", header = FALSE, sep = "")
trainDF["subject"] <- NA
trainDF$subject <- trainSub$V1
testDF = read.table("./test/X_test.txt", header = FALSE, sep = "")
testSub <- read.table("./test/subject_test.txt", header = FALSE, sep = "")
testDF["subject"] <- NA
testDF$subject <- testSub$V1
## merges the files together row(s) 
resDF = rbind(testDF,trainDF,dparse.level=1)
sumDF <- summary(resDF)
