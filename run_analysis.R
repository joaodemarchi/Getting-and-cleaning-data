# Load packages for the protect:
library(dplyr)
library(stringr)
# Download and unzip the files with data for the project:
if (!file.exists("./data")){dir.create("./data")}
fileurl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileurl, destfile = "./data/project.zip")
unzip("./data/project.zip", exdir = "./data") 
# The unzip command creates a directory called "UCI HAR Dataset", in the data 
# directory, with the files for the project.

# Read the train data into R:
subject_train <- read.table("./data/UCI HAR Dataset/train/subject_train.txt",
                           header = FALSE)
x_train <- read.table("./data/UCI HAR Dataset/train/X_train.txt", 
                      header = FALSE)
y_train <- read.table("./data/UCI HAR Dataset/train/y_train.txt",
                      header = FALSE)

# Read the test data into R:
subject_test <- read.table("./data/UCI HAR Dataset/test/subject_test.txt",
                          header = FALSE)
x_test <- read.table("./data/UCI HAR Dataset/test/X_test.txt",
                     header = FALSE)
y_test <- read.table("./data/UCI HAR Dataset/test/y_test.txt",
                     header = FALSE)

# Creating the test data frame:
test <- data.frame("Set" = rep("Test",nrow(subject_test)), "Subject" = subject_test$V1, "Activity" = y_test$V1)
test <- bind_cols(test,x_test)

# Creating the train data frame:
train <- data.frame("Set" = rep("Train",nrow(subject_train)), "Subject" = subject_train$V1, "Activity" = y_train$V1)
train <- bind_cols(train,x_train)

# 1. Merge the training and the test sets to create one data set called united_data
united_data <- bind_rows(test,train)

# Finding only the mean and standard deviation measurements in the features data
# Read the features file into R:
features <- read.table("./data/UCI HAR DAtaset/features.txt",header = FALSE)
mean <- grep("mean()", features$V2)
deviation <- grep("std()",features$V2)
# In the test and train data frames there are 3 more columns then the positions given
# by the grep function. So the next commands add 3 to every value in the mean and 
# deviation vectors:
mean <- mean + 3
deviation <- deviation + 3
measurements <- c(mean,deviation)

names(united_data) <- c("set", "subject", "activity", features$V2)

# 2. Extract only the measurements on the mean and standard deviation for each 
# measurement in the united_data data set:
extracted <- select(united_data, set, subject, activity, all_of(measurements))

# 3. Use descriptive activity names to name the activities in the data set:
# Read the activity labels into R:
activities <- read.table("./data/UCI HAR Dataset/activity_labels.txt", 
                         header = FALSE)

# The activity labels establish a correspondence between the integers in the Activity 
# variable of the extracted data frame and the "name" of the activity. For example 
# the number 5 corresponds to standing.
# The following commands define each of the numbers in extracted$Activity as the 
# real activity they represent:
extracted <- mutate(extracted, activity = as.factor(extracted$activity))
levels(extracted$activity) <- activities$V2
# Removing the "_" character from the activity labels:
extracted<-mutate(extracted, activity = sub("_"," ",extracted$activity))

# Because the extracted data frame includes the variables with the meanFreq() function
# which I will consider, in this case, not part of the extraction asked in the project 
# instructions.
# The next commands remove the variables calculating the meanFreq():
meanfreq <- grep("meanFreq()", names(extracted))
extracted <- select(extracted, -all_of(meanfreq))

#4. Appropriately labels the data set with descriptive variable names.
names(extracted) <- gsub("^t","time ",names(extracted))
names(extracted) <- gsub("^f","frequency ",names(extracted))
names(extracted) <- gsub("(Body)","body ",names(extracted))
names(extracted) <- gsub("(Gravity)","gravity ",names(extracted))
names(extracted) <- gsub("(Acc)","acceleration ",names(extracted))
names(extracted) <- gsub("(Gyro)","gyroscope ",names(extracted))
names(extracted) <- gsub("(Jerk)","jerk ",names(extracted))
names(extracted) <- gsub("(Mag)","magnitude ",names(extracted))
names(extracted) <- gsub("-"," ",names(extracted))

# The extracted data set corresponds to the step 4 data set in the instructions
# for the project.

# 5. From the data set in step 4, create a second, independent tidy data set with 
# the average of each variable for each activity and each subject.
tidy <- group_by(select(extracted,-set), subject, activity) %>%
  summarize(across(.fns = mean.default))

# Write the tidy date to a csv file:
write.table(tidy,file = "./tidy.txt",row.names = FALSE)
