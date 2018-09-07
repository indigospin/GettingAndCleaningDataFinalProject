## Raw variable names are imported and converted to descriptive, readable variable names.

varlabels <- read.table("./UCI HAR Dataset/features.txt", stringsAsFactors = FALSE)
varlabels <- varlabels[,2]
varlabels <- gsub("BodyBody", "Body", varlabels)
varlabels <- gsub("^t", "time_domain_signal_of_", varlabels)
varlabels <- gsub("^f", "frequency_domain_signal_of_", varlabels)
varlabels <- gsub("Body", "body_", varlabels)
varlabels <- gsub("Gravity", "gravitational_", varlabels)
varlabels <- gsub("Acc", "acceleration_", varlabels)
varlabels <- gsub("Gyro", "angular_velocity_", varlabels)
varlabels <- gsub("Jerk", "jerk_", varlabels)
varlabels <- gsub("Mag", "magnitude_", varlabels)
varlabels <- gsub("-X", "along_the_x_axis", varlabels)
varlabels <- gsub("-Y", "along_the_y_axis", varlabels)
varlabels <- gsub("-Z", "along_the_z_axis", varlabels)
varlabels[grep("-mean\\(\\)",varlabels)] <- paste0("mean_", varlabels[grep("-mean\\(\\)",varlabels)])
varlabels <- gsub("-mean\\(\\)", "", varlabels)
varlabels[grep("-std\\(\\)",varlabels)] <- paste0("standard_deviation_of_", varlabels[grep("-std\\(\\)",varlabels)])
varlabels <- gsub("-std\\(\\)", "", varlabels)
varlabels[grep("-mad\\(\\)",varlabels)] <- paste0("median_absolute_deviation_of_", varlabels[grep("-mad\\(\\)",varlabels)])
varlabels <- gsub("-mad\\(\\)", "", varlabels)
varlabels[grep("-max\\(\\)",varlabels)] <- paste0("maximum_", varlabels[grep("-max\\(\\)",varlabels)])
varlabels <- gsub("-max\\(\\)", "", varlabels)
varlabels[grep("-min\\(\\)",varlabels)] <- paste0("minimum_", varlabels[grep("-min\\(\\)",varlabels)])
varlabels <- gsub("-min\\(\\)", "", varlabels)
varlabels[grep("-sma\\(\\)",varlabels)] <- paste0("signal_magnitude_area_of_", varlabels[grep("-sma\\(\\)",varlabels)])
varlabels <- gsub("-sma\\(\\)", "", varlabels)
varlabels[grep("-energy\\(\\)",varlabels)] <- paste0("energy_of_", varlabels[grep("-energy\\(\\)",varlabels)])
varlabels <- gsub("-energy\\(\\)", "", varlabels)
varlabels[grep("-iqr\\(\\)",varlabels)] <- paste0("interquartile_range_of_", varlabels[grep("-iqr\\(\\)",varlabels)])
varlabels <- gsub("-iqr\\(\\)", "", varlabels)
varlabels[grep("-entropy\\(\\)",varlabels)] <- paste0("entropy_of_", varlabels[grep("-entropy\\(\\)",varlabels)])
varlabels <- gsub("-entropy\\(\\)", "", varlabels)
varlabels[grep("-arCoeff\\(\\)",varlabels)] <- paste0("autoregression_coefficient_of_", varlabels[grep("-arCoeff\\(\\)",varlabels)])
varlabels <- gsub("-arCoeff\\(\\)", "", varlabels)
varlabels[grep("-correlation\\(\\)",varlabels)] <- paste0("correlation_coefficient_of_", varlabels[grep("-correlation\\(\\)",varlabels)])
varlabels <- gsub("-correlation\\(\\)", "", varlabels)
varlabels[grep("-maxInds\\(\\)",varlabels)] <- paste0("index_of_largest_magnitude_component_of_", varlabels[grep("-maxInds\\(\\)",varlabels)])
varlabels <- gsub("-maxInds\\(\\)", "", varlabels)
varlabels[grep("-meanFreq\\(\\)",varlabels)] <- paste0("weighted_average_of_components_of_", varlabels[grep("-meanFreq\\(\\)",varlabels)])
varlabels <- gsub("-meanFreq\\(\\)", "", varlabels)
varlabels[grep("-skewness\\(\\)",varlabels)] <- paste0("skewness_of_", varlabels[grep("-skewness\\(\\)",varlabels)])
varlabels <- gsub("-skewness\\(\\)", "", varlabels)
varlabels[grep("-kurtosis\\(\\)",varlabels)] <- paste0("kurtosis_of_", varlabels[grep("-kurtosis\\(\\)",varlabels)])
varlabels <- gsub("-kurtosis\\(\\)", "", varlabels)
varlabels[grep("-bandsEnergy\\(\\)-",varlabels)] <- paste0("binned_energy_of_", varlabels[grep("-bandsEnergy\\(\\)-",varlabels)])
varlabels <- gsub("-bandsEnergy\\(\\)-", "on_interval_", varlabels)
varlabels[grep("^angle\\(",varlabels)] <- paste0("vector_angle_between_", varlabels[grep("^angle\\(",varlabels)])
varlabels <- gsub("angle\\(", "", varlabels)
varlabels <- gsub("\\)$", "", varlabels)
varlabels <- gsub("tbody_", "mean_time_domain_signal_of_body_", varlabels)
varlabels <- gsub("X", "x_axis_", varlabels)
varlabels <- gsub("Y", "y_axis_", varlabels)
varlabels <- gsub("Z", "z_axis_", varlabels)
varlabels[grep("\\,gravityMean|\\,gravity",varlabels)] <- paste0(varlabels[grep("\\,gravityMean|\\,gravity",varlabels)], "and_mean_gravity")
varlabels <- gsub("\\,gravityMean|\\,gravity", "", varlabels)
varlabels <- gsub("Mean|Mean\\)", "", varlabels)
varlabels <- gsub("_$", "", varlabels)
varlabels <- gsub("\\,", "_", varlabels)

## Raw test set data, subjects, and activity values are imported and bound together into columns.  Raw activity values are given descriptive, readable names.

testsubjects <- read.table("./UCI HAR Dataset/test/subject_test.txt")
testsubjects <- unlist(testsubjects, use.names = FALSE)
testactivities <- read.table("./UCI HAR Dataset/test/y_test.txt")
testactivities <- as.character(unlist(testactivities, use.names = FALSE))
testactivities <- gsub("1", "walking", testactivities)
testactivities <- gsub("2", "walking upstairs", testactivities)
testactivities <- gsub("3", "walking downstairs", testactivities)
testactivities <- gsub("4", "sitting", testactivities)
testactivities <- gsub("5", "standing", testactivities)
testactivities <- gsub("6", "laying", testactivities)
testvalues <- read.fwf("./UCI HAR Dataset/test/X_test.txt", widths = c(1,rep(16, length(varlabels))))
testvalues <- testvalues[,-1]
colnames(testvalues) <- varlabels
testsetfull <- cbind("subject" = testsubjects, "activity" = testactivities, testvalues)
rm(testsubjects, testactivities, testvalues)

## Raw training set data, subjects, and activity values are imported and bound together into columns.  Raw activity values are given descriptive, readable names.

trainsubjects <- read.table("./UCI HAR Dataset/train/subject_train.txt")
trainsubjects <- unlist(trainsubjects, use.names = FALSE)
trainactivities <- read.table("./UCI HAR Dataset/train/y_train.txt")
trainactivities <- as.character(unlist(trainactivities, use.names = FALSE))
trainactivities <- gsub("1", "walking", trainactivities)
trainactivities <- gsub("2", "walking upstairs", trainactivities)
trainactivities <- gsub("3", "walking downstairs", trainactivities)
trainactivities <- gsub("4", "sitting", trainactivities)
trainactivities <- gsub("5", "standing", trainactivities)
trainactivities <- gsub("6", "laying", trainactivities)
trainvalues <- read.fwf("./UCI HAR Dataset/train/X_train.txt", widths = c(1,rep(16, length(varlabels))))
trainvalues <- trainvalues[,-1]
colnames(trainvalues) <- varlabels
trainsetfull <- cbind("subject" = trainsubjects, "activity" = trainactivities, trainvalues)
rm(trainsubjects, trainactivities, trainvalues)

## Test and training data sets are merged to form a single data set.

datamerged <- rbind(testsetfull, trainsetfull)
datamerged <- datamerged[order(datamerged$subject),]
datamerged$subject <- as.factor(datamerged$subject)

## Subjects, activities, and variables consisting of mean and standard deviation measurements are extracted to form a new, reduced data set.

meanstdcols <- grep("^mean_|^standard_deviation_of_",names(datamerged))
datameanstd <- datamerged[,c(1, 2, meanstdcols)]

## This new, reduced data set is grouped by subject and activity, summarized to give average values of each variable, and exported as a tidy .txt data table.

library(dplyr)

datameanstdtbl <- as_tibble(datameanstd)
finalsummary <- datameanstdtbl %>% group_by(subject, activity) %>% summarize_all(mean)

write.table(finalsummary, file = "tidy_data_set_of_averages.txt", row.names = FALSE)