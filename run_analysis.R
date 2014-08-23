## run_analysis function by David Tomashek
## package built to meet requirements of course project
## Coursera Data Science program, Getting and Cleaning Data Course, August 2014
## Jeff Leek, Instructor

## The function assumes the user has already downloaded the
## UCI HAR Dataset to a folder in the working directory

run_analysis <- function(){
  ## read test data
    tst <- read.table("UCI HAR Dataset/test/X_test.txt",stringsAsFactors=F)
    tstact <- read.table("UCI HAR Dataset/test/Y_test.txt",stringsAsFactors=F)
    tstsub <- read.table("UCI HAR Dataset/test/subject_test.txt",stringsAsFactors=F)
  ## add test subject and activity as new columns to Test data
    tst$Subject <- tstsub[,1]
    tst$Activity <- tstact[,1]
  ## read training data
    trn <- read.table("UCI HAR Dataset/train/X_train.txt",stringsAsFactors=F)
    trnact <- read.table("UCI HAR Dataset/train/Y_train.txt",stringsAsFactors=F)
    trnsub <- read.table("UCI HAR Dataset/train/subject_train.txt",stringsAsFactors=F)
  ## add training subject and activity as new columns to training data
    trn$Subject <- trnsub[,1]
    trn$Activity <- trnact[,1]
  ## union datasets 
    unn <- rbind(tst,trn)
  ## read activity description data
    actdesc <- read.table("UCI HAR Dataset/activity_labels.txt",stringsAsFactors=F)
  ## join to activity description data
    mrg <- merge(unn,actdesc,by.x="Activity",by.y="V1",all=TRUE)
  ## read features list, make them column headers for X_test data frame
    dndf <- read.table("UCI HAR Dataset/features.txt", stringsAsFactors=F)
    dn.lst <- list(c("ActNum",dndf[,2],"Subject","Activity"))
    dimnames(mrg)[2] <- dn.lst
  ##create vector of desired columns (only mean and std)
    mn <- grep("mean\\(",dndf[,2])
    sd <- grep("std",dndf[,2])
    cn <- sort(c(mn,sd,562,563)+1)
  ## results
    rsltCol <- mrg[,cn] ##new data frame that only contains desired columns
    sumcol <- unlist(dimnames(rsltCol)[2])[1:66] ##columns to be aggregated
    results <- aggregate(rsltCol[sumcol], by=rsltCol[c("Subject","Activity")], FUN=mean)
  ## write file
    write.table(results,"AveragesBySubjectActivity.txt",row.names=F)
}