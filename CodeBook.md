---
title: "CodeBook"
author: "Bella Veksler"
date: "June 18, 2014"
output: html_document
---
# The Study : Human Activity Recognition Using Smartphones Dataset (Version 1.0)

## Dataset obtained from: 
Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.

Smartlab - Non Linear Complex Systems Laboratory

DITEN - Universit‡ degli Studi di Genova.

Via Opera Pia 11A, I-16145, Genoa, Italy.

activityrecognition@smartlab.ws 

www.smartlab.ws

==================================================================

## Study Design (from README.txt file from original authors):

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.


##Feature Selection (from features_info.txt from original authors):
The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

## The Variables
### Subject: 
* A subject ID for each of the 30 subjects who participated in the study
* Levels: 1-30

### ActivityName: 
* One of 6 activities performed by the participants
* Levels: 
    + WALKING
    + WALKING_UPSTAIRS
    + WALKING_DOWNSTAIRS
    + SITTING
    + STANDING
    + LAYING

### Measurement (Feature): 
* Measurements obtained from various parts of the body during the study
* Levels: mean and std values for each of: 
    + tBodyAcc-XYZ
    + tGravityAcc-XYZ
    + tBodyAccJerk-XYZ
    + tBodyGyro-XYZ
    + tBodyGyroJerk-XYZ
    + tBodyAccMag
    + tGravityAccMag
    + tBodyAccJerkMag
    + tBodyGyroMag
    + tBodyGyroJerkMag
    + fBodyAcc-XYZ
    + fBodyAccJerk-XYZ
    + fBodyGyro-XYZ
    + fBodyAccMag
    + fBodyAccJerkMag
    + fBodyGyroMag
    + fBodyGyroJerkMag
* Note: 
    + all measurements have been normalized and scaled between [-1,1] so are unitless


## The Data
* MeanValue column in the data file
* The mean value of each of the measurements with respect to each subject and activity label


## Transformations/Clean Up
* The training and test sets were merged so all 30 subjects are included in the final tidydata file
* Only the mean of the mean and std for each measurement was included in the final cleaned data (of the 561 features down to 66)
* Each activity is labeled 
* The original data had a column for each measurement, so each row was a feature vector of all the measurements for the subject during a particular activity
    + the cleaned data 'melted' this into a long vector so each row is now a subject-activity-measurement triple with the corresponding mean value
