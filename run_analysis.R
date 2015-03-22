run_analysis <- function (data) {
  
  #Part 1: Merges the training and the test sets to create one data set
  train_data <- read.table("UCI HAR Dataset/train/X_train.txt")
  test_data <- read.table("UCI HAR Dataset/test/X_test.txt")
  
  #add column for activity levels
  activity.train_data <- read.table("UCI HAR Dataset/train/y_train.txt")
  activity.test_data <- read.table("UCI HAR Dataset/test/y_test.txt")
  train_data <- cbind(train_data,activity.train_data)
  test_data <- cbind(test_data,activity.test_data)
  
  data <- rbind(test_data,train_data)
  
  
  
  #Part 2: Extracts only the measurements on the mean and standard deviation for each measurement. 

  # In order to select the requested data I need to identify the number of the column where data for that measurement begin
  
  feature_list <- c(
  "tBodyAcc-XYZ",
  "tGravityAcc-XYZ",
  "tBodyAccJerk-XYZ",
  "tBodyGyro-XYZ",
  "tBodyGyroJerk-XYZ",
  "tBodyAccMag",
  "tGravityAccMag",
  "tBodyAccJerkMag",
  "tBodyGyroMag",
  "tBodyGyroJerkMag",
  "fBodyAcc-XYZ",
  "fBodyAccJerk-XYZ",
  "fBodyGyro-XYZ",
  "fBodyAccMag",
  "fBodyAccJerkMag",
  "fBodyGyroMag",
  "fBodyGyroJerkMag"
  )
  
  starting_index <- c(
    1,# tBodyAcc-XYZ
    41,# tGravityAcc-XYZ
    81,# tBodyAccJerk-XYZ
    121,# tBodyGyro-XYZ
    161,# tBodyGyroJerk-XYZ
    201,# tBodyAccMag
    214,# tGravityAccMag
    227,# tBodyAccJerkMag
    240,# tBodyGyroMag
    253,# tBodyGyroJerkMag
    266,# fBodyAcc-XYZ
    345,# fBodyAccJerk-XYZ
    424,# fBodyGyro-XYZ
    503,# fBodyAccMag
    516,# fBodyAccJerkMag
    529,# fBodyGyroMag
    542# fBodyGyroJerkMag
  )
  #associate the column number and the measurement description
  features <- data.frame(feature_list,starting_index)

  # Mean and standard deviation are the first and second
  # Features with appendix -XYZ have values for each axis (so I need the first 6 columns)
  # For all other measurements, I need the last two
  
  #Create a new data frame with column descriptive name of a feature and the column of the original data frame it is found in
  
  measurements <- data.frame(Feature=character(),Column=numeric)
  for (i in (1:nrow(features))) { 
    featureName <- as.character(features[i,1])
    first_column <- features[i,2]
    
    #Check whether I need the next 6 columns or just two, depending on the feature type
    
    if ("-XYZ" == substr(featureName, nchar(featureName)-4+1,nchar(featureName))) {
      #get six columns, mean and std for each of the 3 axis
      
      measurements <- rbind(measurements,
            #Mean for all axis
            data.frame(
              Feature=paste(featureName,"-mean()-X"),
              Column=first_column),
            data.frame(
              Feature=paste(featureName,"-mean()-Y"),
              Column=first_column+1),
            data.frame(
              Feature=paste(featureName,"-mean()-Z"),
              Column=first_column+2),
            #Standard deviation for all axis
            data.frame(
              Feature=paste(featureName,"-std()-X"),
              Column=first_column + 3),
            data.frame(
              Feature=paste(featureName,"-std()-Y"),
              Column=first_column + 4),
            data.frame(
              Feature=paste(featureName,"-std()-Z"),
              Column=first_column + 5)
      )
    } else {
      
      #only get first two columns
      measurements <- rbind(measurements,
            data.frame(
              Feature=paste(featureName,"-mean()"),
              Column=first_column),
            data.frame(
              Feature=paste(featureName,"-std()"),
              Column=first_column + 1)
            )
    }
  }
  #finally, add column for activity levels
  measurements <- rbind(measurements,
                        data.frame(
                          Feature="activityLevel",
                          Column=562))
  
  #reduce data frame to the requested columns only
  new_data <- data[,measurements$Column]
  
  # Part 3: Uses descriptive activity names to name the activities in the data set
  new_data$activityLevel <- factor(new_data$activityLevel,labels=c("Walking","Walking upstairs","Walking downstairs","Sitting","Standing","Laying"))
  
  # Part 4: Appropriately labels the data set with descriptive variable names. 
  names(new_data) <- measurements$Feature
  
  new_data
}


#store data
new_data <- run_analysis()
write.table(new_data, file="tidy_data.txt",row.names=FALSE)
