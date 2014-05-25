projectdata <- function() {
    # working directory is UCI HAR Dataset
    # set library
    library(data.table)

    # read in features file. List of all features.
    features <- read.csv("features.txt", sep="", header=FALSE)
    
    # read column names
    colNames <- read.table("features.txt", stringsAsFactors = F)
    
    # read in activity labels. Links the class labels with their activity name.
    actlabels <- read.csv("activity_labels.txt", sep="", header=FALSE)
    
    # read in training set.
    xtrain <- read.csv("./train/X_train.txt", sep="", header=FALSE)
    # rename columns
    names(xtrain) <- colNames$V2
    
    # read in training labels.
    ytrain <- read.csv("./train/y_train.txt", sep="", header=FALSE)
    # create factor column for acitivity rename
    ytrain$V2 <- factor(ytrain$V1)

    # read in test set.
    xtest <- read.csv("./test/X_test.txt", sep="", header=FALSE)
    # rename columns
    names(xtest) <- colNames$V2
    
    # read in test labels.
    ytest <- read.csv("./test/y_test.txt", sep="", header=FALSE)
    # create factor column for acitivity rename
    ytest$V2 <- factor(ytest$V1)

    # merge training set and labels columns
    traindata <- cbind(ytrain, xtrain)
    
    # merge test set and labels columns
    testdata <- cbind(ytest, xtest)
    
    # merge test and training set rows to satisfy project part 1
    alldata <- rbind(traindata, testdata)
    
    # rename activity columns
    names(alldata)[1] <- "actnum"
    names(alldata)[2] <- "Activity"

   # create data table and hard code activities to satisfy part 3   
   DT1 = as.data.table(alldata)
   DT1[actnum==1, Activity := "WALKING"]
   DT1[actnum==2, Activity := "WALKING_UPSTAIRS"]
   DT1[actnum==3, Activity := "WALKING_DOWNSTAIRS"]
   DT1[actnum==4, Activity := "SITTING"]
   DT1[actnum==5, Activity := "STANDING"]
   DT1[actnum==6, Activity := "LAYING"]
   
   
   DT1
   
   
}