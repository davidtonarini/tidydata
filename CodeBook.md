# Tidy dataset from UCL HAR Dataset
Project for data science course on Coursera

## Original dataset
The experiments have been carried out with a group of 30 volunteers wearing a smartphone (Samsung Galaxy S II) on the waist. 

Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) . 

Using its embedded accelerometer and gyroscope, researchers captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. 

The obtained dataset was randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

## Used data
In this project we used only mean and standard deviation value for each of the measured feature.

The following feature were measured


The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

## Merging the data
The original dataset was randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

In this project we created a tidy dataset using both the training data and the test data. The two original datasets were joined. 

Since in the original files data for activity level was provided in a separate file, this information was added to the resulting data set.

## Naming
In the resulting data set, each column was named using the feature list described above as a prefix. The suffixes -mean() and -std() were used to idenfify mean and standard deviation respectively. Some measurements were separately provided for any of the spatial axis. For these measurements, an additional suffix (-X, -Y or -Z) was added to identify the axis


## Step by step
The run_analysis.R runs a function that creates the tidy dataset and stores it as a file named tidy_data.txt
The script runs the following steps
### Part 1: 
Merges the training and the test sets to create one data set (see section "Merging the dataset", above, for more details)

### Part 2: 
Extracts only the measurements on the mean and standard deviation for each measurement, and adds a column activityLevel 

### Part 3:
Uses descriptive activity names to name the activities in the data set, by applying a factor of the six different activity types

### Part 4: 
Appropriately labels the data set with descriptive variable names, following the naming conventions describe in "Naming" section above
  
 