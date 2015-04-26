## Programming assignment 
## Week 3: Getting and Cleaning Data
## Santiago Armida, 2015-04-26
## 
## run_analysis.R.
## Takes two files: test x and train x   marges the files together 
##  Starts in directory UCI HAR Dataset
trainDF = read.table("./train/X_train.txt", header = FALSE, sep = "")
trainSub <- read.table("./train/subject_train.txt", header = FALSE, sep = "")
trainAct <- read.table("./train/Y_train.txt", header = FALSE, sep = "")
trainDF["subject"] <- NA
trainDF$subject <- trainSub$V1
trainDF["activity"] <- NA
trainDF$activity <- trainAct$V1
testDF = read.table("./test/X_test.txt", header = FALSE, sep = "")
testSub <- read.table("./test/subject_test.txt", header = FALSE, sep = "")
testAct <- read.table("./test/Y_train.txt", header = FALSE, sep = "")
testDF["subject"] <- NA
testDF$subject <- testSub$V1
testDF["activity"] <- NA
testDF$activity <- testAct$V1
## merges the files together ADD row(s) 
resDF = rbind(testDF,trainDF,dparse.level=1)
sumDF <- summary(resDF)actDF
## DF for information o column names and activity names 
actDF = read.table("./activity_labels.txt", header = FALSE, sep = "")
featDF = read.table("./features.txt", header = TRUE, sep = "")
##use dplyr to select mean and sd columns 
library(dplyr)
selDF <- select(resDF, subject,activity,1:6,41:46,81:86,121:126,161:166,201,202,214,215,227,228,40,241,253,254,266:271,345:350,424:429,503:504)
## rename columns
selDF <- rename(selDF,tBodyAcc_mean_X=V1,tBodyAcc_mean_Y=V2,tBodyAcc_mean_Z=V3)
selDF <- rename(selDF,tBodyAcc_std_X=V4,tBodyAcc_std_Y=V5,tBodyAcc_std_Z=V6)
# get mean value for activuty and subject
# grpDF <- groupby(selDF,subject,activity,mean(tBody_Acc_mean_X),mean(tBody_Acc_mean_Y),mean(tBody_Acc_mean_Z),mean(tBody_Acc_std_X),mean(tBody_Acc_std_Y),mean(tBody_Acc_mean_Z),mean(tV41),mean(tV42),mean(tV43),mean(tV44),mean(tV45),mean(tV46),mean(tV81),mean(tV82),mean(tV83),mean(tV84),mean(tV85),mean(tV86),mean(tV121),mean(tV122),....)
## writes text file
write.table(selDF,file="./tidy.txt",row.name=FALSE)
## end of analysis
