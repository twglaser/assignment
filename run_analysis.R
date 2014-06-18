#General notes
#Environment is Mac OS X 10.7.5 with 4GB Memory
#R Version 3.1.2
#Before running this script, create a subdirectory called
#"~/Desktop/Coursera/Data Science - Johns Hopkins/Cleanup Project/"
#Download "getdata-projectfiles-UCI HAR Dataset.zipunzip", then unzip it
#Read in training and test data
#Ignore the data in the "inertial signals" subfolders
#There are 21 subjects in training dataset (7352 obs); 9 subjects in test dataset (2947 obs).

#The following instructions read in the data
X_train <- read.table("~/Desktop/Coursera/Data Science - Johns Hopkins/Cleanup Project/UCI HAR Dataset/train/X_train.txt", quote="\"")
X_test <- read.table("~/Desktop/Coursera/Data Science - Johns Hopkins/Cleanup Project/UCI HAR Dataset/test/X_test.txt", quote="\"")
features <- read.table("~/Desktop/Coursera/Data Science - Johns Hopkins/Cleanup Project/UCI HAR Dataset/features.txt", quote="\"")
activity_labels <- read.table("~/Desktop/Coursera/Data Science - Johns Hopkins/Cleanup Project/UCI HAR Dataset/activity_labels.txt", quote="\"")
y_test <- read.table("~/Desktop/Coursera/Data Science - Johns Hopkins/Cleanup Project/UCI HAR Dataset/test/y_test.txt", quote="\"")
y_train <- read.table("~/Desktop/Coursera/Data Science - Johns Hopkins/Cleanup Project/UCI HAR Dataset/train/y_train.txt", quote="\"")
subject_test <- read.table("~/Desktop/Coursera/Data Science - Johns Hopkins/Cleanup Project/UCI HAR Dataset/test/subject_test.txt", quote="\"")
subject_train <- read.table("~/Desktop/Coursera/Data Science - Johns Hopkins/Cleanup Project/UCI HAR Dataset/train/subject_train.txt", quote="\"")

#The following section assigns column names from features
colnames(X_train) <- features$V2
colnames(X_test) <- features$V2

#The following section appends sub(ject) ids to rows in X_test and X_train
X_test_with_sub<-cbind(subject_test,X_test) #adds subject ID in col 1 to X_test
X_train_with_sub<-cbind(subject_train,X_train) #adds subject ID in col 1 to X_train

#activity_labels relate to y_test and y_train
X_test_with_sub_and_activity_code<-cbind(y_test,X_test_with_sub)
X_train_with_sub_and_activity_code<-cbind(y_train,X_train_with_sub)

#change names of 2nd column
colnames(X_test_with_sub_and_activity_code)[2]<-'subID'
colnames(X_train_with_sub_and_activity_code)[2]<-'subID'

#merge to append activity_label V2. This is called "V2" and goes into position [564]
#NOTE!!! this will generate a warning message that several dozen column names are duplicated in the results
#This is a known problem with the "features" dataset. It is not necessary to change the column names because the impacted columns
#don't meet the criteria for the final extract
X_test_with_sub_and_activity_type<-merge(X_test_with_sub_and_activity_code,activity_labels,by.x="V1",by.y="V1")
X_train_with_sub_and_activity_type<-merge(X_train_with_sub_and_activity_code,activity_labels,by.x="V1",by.y="V1")

#append group field to associate with test or train group
X_test_with_sub_and_activity_type$group=c("test")
X_train_with_sub_and_activity_type$group=c("train")

#move activity column to front of test and train files
col_idx <- grep("V2", names(X_test_with_sub_and_activity_type)) 
test_final <- X_test_with_sub_and_activity_type[, c(col_idx, (1:ncol(X_test_with_sub_and_activity_type))[-col_idx])]
col_idx <- grep("V2", names(X_train_with_sub_and_activity_type)) 
train_final <- X_train_with_sub_and_activity_type[, c(col_idx, (1:ncol(X_train_with_sub_and_activity_type))[-col_idx])]

#stack test and train
allData<-rbind(test_final,train_final)

#remove the activity label code
dfFinal<-subset(allData, select = -V1)

#change name of V1 to "activity"
colnames(dfFinal)[1]<-'activity'

#Extract measurements on the means and standard deviations. Include activity, subID and group in the extract
dfExtract<-dfFinal[, grepl("activity|subID|group|mean[[:punct:]]|std[[:punct:]]",names(dfFinal))]

#Create new dataframes that calculate mean for each var for each activity and subID
dfx68<-dfExtract[,1:68] #drop "group" (last variable): chr
MeanActivity<-data.frame(do.call(rbind,by(dfx68[,-(1:2)], paste("mean-activity",dfx68[,1],sep="-"), colMeans))) 
MeanSubID<-data.frame(do.call(rbind,by(dfx68[,-(1:2)], paste("mean-subID",dfx68[,2],sep="-"), colMeans))) 

#The 8 lines of code commented with double pound signs below are not needed for the assignment, but they're useful for other functions.
#Create new dataframes that calculate sd for each var for each activity and subID.
#The approach used above (colMeans) doesn't work for sd, so I'm using an alternate approach for sd.
##sdActivity <- aggregate(dfx68[,names(dfx68)],list(dfx68$activity),sd)
##rownames(sdActivity) <- paste0("sd-id-",sdActivity$Group.1)
##sdActivity$Group.1 <- NULL
##sdAct<-sdActivity[,(-1:-2)] #removes activity and subID columns

##sdSubID <- aggregate(dfx68[,names(dfx68)],list(dfx68$subID),sd)
##rownames(sdSubID) <- paste0("sd-id-",sdSubID$Group.1)
##sdSubID$Group.1 <- NULL
##sdSub<-sdSubID[,(-1:-2)] #removes activity and subID columns

#Binds MeanActivity and MeanSubID together into second independent dataset
tinyds2<-rbind(MeanActivity,MeanSubID)

#Cleanup variable names
newnames<-gsub("[[:punct:]]", " ", names(tinyds2)) #removes all punctuation from variable names
colnames(tinyds2)<-gsub(" ","", newnames) #removes all whitespace from variable names and replaces column names

#Exports dataset to comma-delimited txt file
write.csv(tinyds2,"tidyds2.txt")



