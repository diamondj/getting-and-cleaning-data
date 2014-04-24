run_analysis <- function()
{
    library(reshape2)
    X1 <- read.table("./train/X_train.txt", header = FALSE)
    X2 <- read.table("./test/X_test.txt", header = FALSE)
    Y1 <- read.table("./train/y_train.txt", header = FALSE)
    Y2 <- read.table("./test/y_test.txt", header = FALSE)
    subTrain <- read.table("./train/subject_train.txt", header = FALSE)
    subTest <- read.table("./test/subject_test.txt", header = FALSE)
    features <- read.table("features.txt", header = FALSE)
    X <- rbind(X1, X2)
    Y <- rbind(Y1, Y2)
    subject <- rbind(subTrain, subTest)
    names(X) <- features[,2]
    names(subject) <- "subject"
    names(Y) <- "activitylabels"
    Y$activity <- "labels"
    Y$activity[Y$activitylabels==1] <- "walking"
    Y$activity[Y$activitylabels==2] <- "walking-upstairs"
    Y$activity[Y$activitylabels==3] <- "walking-downstairs"
    Y$activity[Y$activitylabels==4] <- "sitting"
    Y$activity[Y$activitylabels==5] <- "standing"
    Y$activity[Y$activitylabels==6] <- "laying"
    select <- grep("mean|std",names(X))
    Xselect <- X[,select]
    Xname <- names(Xselect)
    Xname <- sub("-", "", Xname)
    Xname <- sub("^t", "time-domain-", Xname)
    Xname <- sub("^f", "frequency-domain-", Xname)
    Xname <- sub("Acc", "-accelerometer-", Xname)
    Xname <- sub("Gyro", "-gyroscope-", Xname)
    Xname <- sub("Mag", "-magnitude-", Xname)
    Xname <- sub("BodyBody", "Body", Xname)
    Xname <- sub("Freq", "-frequency", Xname)
    names(Xselect) <- Xname
    activity <- Y[ , 2]
    data.frame <- cbind(subject, activity, Xselect)
    melt.data <- melt(data.frame, id=c("subject","activity"))
    tide.data <- dcast(melt.data, subject + activity ~ variable, mean)
    write.table(tide.data, file="tidydata.txt")
}