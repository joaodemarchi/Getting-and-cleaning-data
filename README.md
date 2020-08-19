This repository was created for the Getting and Cleaning Data course project. The project consists in tidying a data set on wearable technology.
More information abput the data in this project can be found at:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The actual data can be found at:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Files:
"run_analysis.R": describes the processing of the data set provided, comenting each step to highlight that all the requirements were completed. 
This script will load the necessary packages and download and read the data necessary to run the analysis.
Then the code will:
1. Merge the training and the test sets to create one data set called "united_data".
2. Extract only the measurements on the mean and standard deviation for each measurement.
3. Use descriptive activity names to name the activities in the data set.
4. Appropriately label the data set with descriptive variable names forming the "extracted" data set.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject, whitch is the data writen with the write.table() command, "tidy.txt"

"tidy.txt": the tidy data with the average of each variable for each activity and each subject (in txt format - uploaded with the write.table command)

"CodeBook.md": a R markdown file describing each variable, the data, and the process to achieve the "tidy.txt" file.

"README.md": a R markdown file containing a short description of the course project, the description of each file in the repository, and how they are connected. 