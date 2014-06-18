**General notes**

- This script was run on a Mac OS X 10.7.5 with 4GB Memory. 
- R Version 3.1.2
- Before running this script, create a subdirectory called
- "~/Desktop/Coursera/Data Science - Johns Hopkins/Cleanup Project/"
- Download "getdata-projectfiles-UCI HAR Dataset.zipunzip", then unzip it
- Read in training and test data
- Ignore the data in the "inertial signals" subfolders
- There are 21 subjects in the training dataset (7352 obs); 9 subjects in test dataset (2947 obs).
- The output is a file called tinyds2.txt and contains 36 rows of numeric data in 66 columns. The file also contains column names in the top row and row names in the first column.

**Reading in the data**

The following instructions read in the data:

- X\_train <- read.table("~/Desktop/Coursera/Data Science - Johns Hopkins/Cleanup Project/UCI HAR Dataset/train/X\_train.txt", quote="\"")
- X\_test <- read.table("~/Desktop/Coursera/Data Science - Johns Hopkins/Cleanup Project/UCI HAR Dataset/test/X\_test.txt", quote="\"")
- features <- read.table("~/Desktop/Coursera/Data Science - Johns Hopkins/Cleanup Project/UCI HAR Dataset/features.txt", quote="\"")
- activity\_labels <- read.table("~/Desktop/Coursera/Data Science - Johns Hopkins/Cleanup Project/UCI HAR Dataset/activity\_labels.txt", quote="\"")
- y\_test <- read.table("~/Desktop/Coursera/Data Science - Johns Hopkins/Cleanup Project/UCI HAR Dataset/test/y\_test.txt", quote="\"")
- y\_train <- read.table("~/Desktop/Coursera/Data Science - Johns Hopkins/Cleanup Project/UCI HAR Dataset/train/y\_train.txt", quote="\"")
- subject\_test <- read.table("~/Desktop/Coursera/Data Science - Johns Hopkins/Cleanup Project/UCI HAR Dataset/test/subject\_test.txt", quote="\"")
- subject\_train <- read.table("~/Desktop/Coursera/Data Science - Johns Hopkins/Cleanup Project/UCI HAR Dataset/train/subject\_train.txt", quote="\"")



**How the script works:**

_Step 1_ assigns column names from features

- colnames(X\_train) <- features$V2
- colnames(X\_test) <- features$V2

_Step 2_ appends sub(ject) ids to rows in X\_test and X\_train

- X\_test\_with\_sub<-cbind(subject\_test,X\_test) 
- X\_train\_with\_sub<-cbind(subject\_train,X\_train) 

_Step 3_ binds activity\_labels to dataframes created in Step 2

- X\_test\_with\_sub\_and\_activity\_code<-cbind(y\_test,X\_test\_with\_sub)
- X\_train\_with\_sub\_and\_activity\_code<-cbind(y\_train,X\_train\_with\_sub)

_Step 4 _changes names of 2nd column in dataframes created in Step 3

- colnames(X\_test\_with\_sub\_and\_activity\_code)[2]<-'subID'
- colnames(X\_train\_with\_sub\_and\_activity\_code)[2]<-'subID'

_Step 5 _appends activity\_label V2. The system assigns it the name "V2" and place it into position [564]_. _NOTE!!! that will generate a warning message that several dozen column names are duplicated in the results_. _This is a known problem with the "features" dataset. It is not necessary to change the column names because the impacted columnsdon't meet the criteria for inclusion in the final extract, tinyds2.

- X\_test\_with\_sub\_and\_activity\_type<-merge(X\_test\_with\_sub\_and\_activity\_code,activity\_labels,by.x="V1",by.y="V1")
- X\_train\_with\_sub\_and\_activity\_type<-merge(X\_train\_with\_sub\_and\_activity\_code,activity\_labels,by.x="V1",by.y="V1")

_Step 6_ appends group field to associate with test or train group. This is specified in the assignment's instructions, but the test/train distinction is not required in the final extract, tinyds2, and is included here only on a pro-forma basis.

- X\_test\_with\_sub\_and\_activity\_type$group=c("test")
- X\_train\_with\_sub\_and\_activity\_type$group=c("train")

_Step 7_ moves activity column to front of test and train files

- col\_idx <- grep("V2", names(X\_test\_with\_sub\_and\_activity\_type)) 
- test\_final <- X\_test\_with\_sub\_and\_activity\_type[, c(col\_idx, (1:ncol(X\_test\_with\_sub\_and\_activity\_type))[-col\_idx])]
- col\_idx <- grep("V2", names(X\_train\_with\_sub\_and\_activity\_type)) 
- train\_final <- X\_train\_with\_sub\_and\_activity\_type[, c(col\_idx, (1:ncol(X\_train\_with\_sub\_and\_activity\_type))[-col\_idx])]

_Step 8_ stacks test and train

- allData<-rbind(test\_final,train\_final)

_Step 9_ removes the activity label code. It is redundant because we've appended the activity labels.

- dfFinal<-subset(allData, select = -V1)

_Step 10_ changes name of V1 to "activity"

- colnames(dfFinal)[1]<-'activity'

_Step 11_ extracts measurements of the means and standard deviations filtered on "mean()" and "std()". It also include activity, subID and group in the extract.

- dfExtract<-dfFinal[, grepl("activity|subID|group|mean[[:punct:]]|std[[:punct:]]",names(dfFinal))]

_Step 12_ creates new dataframes that calculate mean for each var for each activity and subID

- dfx68<-dfExtract[,1:68] #drop "group" (last variable): chr
- MeanActivity<-data.frame(do.call(rbind,by(dfx68[,-(1:2)], paste("mean-activity",dfx68[,1],sep="-"), colMeans))) 
- MeanSubID<-data.frame(do.call(rbind,by(dfx68[,-(1:2)], paste("mean-subID",dfx68[,2],sep="-"), colMeans))) 



_Step 13_ binds MeanActivity and MeanSubID together into independent dataset

- tinyds2<-rbind(MeanActivity,MeanSubID)

_Step 14_ cleans up variable names

- newnames<-gsub("[[:punct:]]", " ", names(tinyds2)) #removes all punctuation from variable names
- colnames(tinyds2)<-gsub(" ","", newnames) #removes all whitespace from variable names and replaces column names

Step 15 exports dataset to comma-delimited txt file

- csv(tinyds2,"tidyds2.txt")
