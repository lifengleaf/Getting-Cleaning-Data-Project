
# This R script does the following:

# 1. Merges the training and the test sets to create one data set.
# 2. Extracts only the measurements on the mean and standard deviation
# for each measurement. 
# 3. Uses descriptive activity names to name the activities in the data set
# 4. Appropriately labels the data set with descriptive variable names. 
# 5. From the data set in step 4, creates a second, independent tidy data set
# with the average of each variable for each activity and each subject.



## STEP 1: Process test data and merge into one test dataset


# Load data: activity labels. Each subject performed 6 activities.
activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt")[,2]

# Load data: feature names
# It has 561 features in total, including mean value, standard deviation,
# median absolute deviation, largest and smallest value, etc. for measurements.
feature_names <- read.table("./UCI HAR Dataset/features.txt")[,2]

# Extract only the measurements on the mean and standard deviation,
# resulting in 79 extracted features
extract_features <- grepl("mean|std", feature_names)

# Load test set data
X_test <- read.table("./UCI HAR Dataset/test/X_test.txt")

# Change colnames from feature ID to more descriptive feature names
names(X_test) <- feature_names

# Extract only the mean and standard deviation for each measurement
X_test<- X_test[,extract_features]

# Load test activity labels
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt")

# Add corresponding activity label names as a second column
y_test[,2]<- activity_labels[y_test[,1]]
names(y_test)<- c("Activity_ID", "Activity_Label")

# Load subject data
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")
names(subject_test)<- "Subject_ID"

# Bind subject data, test labels and test set into one single dataset
test_data <- cbind(subject_test, y_test, X_test)


## STEP 2: Process train data and merge into one train dataset


# Load train set data
X_train <- read.table("./UCI HAR Dataset/train/X_train.txt")

# Change colnames from feature ID to more descriptive feature names
names(X_train)<- feature_names

# Extract only the measurements on the mean and standard deviation
X_train<- X_train[,extract_features]

# Load train activity labels
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt")

# Add corresponding activity label names as a second column
y_train[,2]<- activity_labels[y_train[,1]]
names(y_train)<- c("Activity_ID", "Activity_Label")

# Load subject data
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")
names(subject_train)<- "Subject_ID"

# Bind subject data, train labels and train set into one single dataset
train_data <- cbind(subject_train, y_train, X_train)


## STEP 3: Merge test and train data


merge_data<- rbind(test_data, train_data)


## STEP 4: Create a new dataset with the average of each variable
## for each activity and each subject


# Distinguish ID labels from value labels
# ID labels are "Subject_ID" "Activity_ID" "Activity_Label" 
# value labels are means and standard deviations of measurements
ID_labels<- colnames(merge_data)[1:3]
value_labels<- colnames(data)[4:length(merge_data)]

# install and load required package if it doesn't have
if (!require("reshape2")) {
      install.packages("reshape2")
}
library("reshape2")

# Use melt function to stack the value labels into one single column
melt_data<- melt(merge_data, id.vars = ID_labels,
                 variable.name = "Feature_Name", value.name = "Value")

# Use dcast function to aggregate the melt data by taking the mean of values
# Use Activity_Label instead of Activity_ID which is more descriptive
# to name the activities 
tidy_data<- dcast(melt_data, Subject_ID + Activity_Label ~ Feature_Name,
                  value.var= "Value", fun.aggregate = mean)

head(tidy_data,3)
# First 4 columns and 3 rows of the tidy dataset
#     Subject_ID   Activity_Label
# 1          1         LAYING
# 2          1        SITTING
# 3          1       STANDING
#     tBodyAcc-mean()-X   tBodyAcc-mean()-Y
# 1         0.2215982      -0.040513953
# 2         0.2612376      -0.001308288
# 3         0.2789176      -0.016137590


# Write the tidy data set to a file
write.table(tidy_data, file = "./tidy_data.txt",row.name=FALSE)


