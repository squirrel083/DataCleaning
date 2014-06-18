#Read in the testing, training, and subject files
test=read.table('test/X_test.txt',header=F,sep='',fill=T)
train=read.table('train/X_train.txt',header=F,sep='',fill=T)
testlabels=read.table('test/y_test.txt',header=F)
trainlabels=read.table('train/y_train.txt',header=F)
subjectstest=read.table('test/subject_test.txt')
subjectstrain=read.table('train/subject_train.txt')

#Step 1: Merges the training and the test sets to create one data set.
testset=cbind(subjectstest,testlabels,test)
trainset=cbind(subjectstrain,trainlabels,train)
mergedset=rbind(testset,trainset)

#Step 2: Extracts only the measurements on the mean and standard deviation for each measurement.
features=read.table('features.txt',header=F,sep='',stringsAsFactors=T)
features=as.character(features$V2)         #convert measurement vector into a character vector
allnames=c("Subject","Activity",features)  #concatenate the Subject and ActivityID with the measurements
names(mergedset)=allnames                  #assigns the column labels to the merged data set
means=grep("mean\\()", allnames)		   #logical vector of only the mean() measurements
sds=grep("std\\()", allnames)			   #logical vector of only the std() measurements 
meansandsdonly=mergedset[,c(1,2,means,sds)] #select out only the means and std measurements from the mergedset

#Step 3: Uses descriptive activity names to name the activities in the data set
labels=read.table('activity_labels.txt',header=F)	#read in the label-activity pairs
names(labels)=c("ActivityID","ActivityName")		#give the columns a label
merged=merge(labels, meansandsdonly, by.y="Activity",by.x="ActivityID",all=T)    #merge the labels with the means/std data table

#Step 4: 	Appropriately labels the data set with descriptive variable names. 
#Already done in previous steps

#Step 5: 	Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 
library(reshape2)						
tidydata=melt(merged,id=c("Subject","ActivityName"),measure.vars=c(4:69))	#melt the data frame to make it easier to work with
tidydata=aggregate(value~Subject*ActivityName*variable,data=tidydata,FUN="mean")    #take the mean of the values with respect to each variable/subject/activity combination
names(tidydata)=c("Subject","ActivityName","Measurement","MeanValue")				    #rename the tidydata columns to make sense
write.table(tidydata,'tidydata.txt')											    #we're done!