DataCleaning
============
---
title: "README"
author: "Bella Veksler"
date: "June 18, 2014"
output: html_document
---

This script reads in the test and training sets of data from the Human Activity Recognition Using Smartphones Dataset, combines the two data sets, and aggregates over the means of the triple subject-activity-measurement

The script (run_analysis.R) sequentially does the following:

1. Read in the testing, training, and subject files
2. First binds the columns of the subject IDs with the activity labels and the feature vectors for the test set
3. Binds the columns of subject IDs, activity labels and feature vectors for the training set
4. Merges the two sets by concatenating them (row bind test and train) --> in the variable mergedset
5. Reads in the feature labels and makes sure it is a character vector
6. Concatenate the Subject and ActivityID with the measurements
7. Assigns the column labels to the merged data set
8. Creates a logical vector of only the measurements that end with the label mean()
9. Creates a logical vector of only the measurements that end with the label std()
10. Select out only the means and std measurements from the mergedset --> in the variable meansandsdonly
11. Read in the label-activity pairs and gives the column labels
12. Creates a new merged data set which includes the activity labels --> in the variable merged
13. Melt the data frame to make it easier to work with, making it long instead of wide --> in the variable tidydata
14. Aggregates the data frame by taking the mean at the intersection of each measurement/subject/activity combination and labels columns appropriately  --> in the variable tidydata
15. Writes tidydata out to a file
