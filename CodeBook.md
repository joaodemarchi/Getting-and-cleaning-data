Variable Description:
"subject": Identifies the subject who performed the activity. Its range is from 1 to 30. 

"activity": The activity performed by the subject. Can assume the values listed bellow:
 "WALKING"
 "WALKING UPSTAIRS"
 "WALKING DOWNSTAIRS"
 "SITTING"
 "STANDING"
 "LAYING"

The following variables correspond to the mean of the measurements on the data that are "mean()" or "std()" measurements: 
"time body acceleration  mean() X"                        
"time body acceleration  mean() Y"                       
"time body acceleration  mean() Z"                        
"time gravity acceleration  mean() X"                    
"time gravity acceleration  mean() Y"                     
"time gravity acceleration  mean() Z"                    
"time body acceleration jerk  mean() X"                   
"time body acceleration jerk  mean() Y"                  
"time body acceleration jerk  mean() Z"                   
"time body gyroscope  mean() X"                          
"time body gyroscope  mean() Y"                           
"time body gyroscope  mean() Z"                          
"time body gyroscope jerk  mean() X"                      
"time body gyroscope jerk  mean() Y"                     
"time body gyroscope jerk  mean() Z"                      
"time body acceleration magnitude  mean()"               
"time gravity acceleration magnitude  mean()"             
"time body acceleration jerk magnitude  mean()"          
"time body gyroscope magnitude  mean()"                   
"time body gyroscope jerk magnitude  mean()"             
"frequency body acceleration  mean() X"                   
"frequency body acceleration  mean() Y"                  
"frequency body acceleration  mean() Z"                   
"frequency body acceleration jerk  mean() X"             
"frequency body acceleration jerk  mean() Y"              
"frequency body acceleration jerk  mean() Z"             
"frequency body gyroscope  mean() X"                      
"frequency body gyroscope  mean() Y"                     
"frequency body gyroscope  mean() Z"                      
"frequency body acceleration magnitude  mean()"          
"frequency body body acceleration jerk magnitude  mean()" 
"frequency body body gyroscope magnitude  mean()"        
"frequency body body gyroscope jerk magnitude  mean()"    
"time body acceleration  std() X"                        
"time body acceleration  std() Y"                         
"time body acceleration  std() Z"                        
"time gravity acceleration  std() X"                      
"time gravity acceleration  std() Y"                     
"time gravity acceleration  std() Z"                      
"time body acceleration jerk  std() X"                   
"time body acceleration jerk  std() Y"                    
"time body acceleration jerk  std() Z"                   
"time body gyroscope  std() X"                            
"time body gyroscope  std() Y"                           
"time body gyroscope  std() Z"                            
"time body gyroscope jerk  std() X"                      
"time body gyroscope jerk  std() Y"                       
"time body gyroscope jerk  std() Z"                      
"time body acceleration magnitude  std()"                 
"time gravity acceleration magnitude  std()"             
"time body acceleration jerk magnitude  std()"            
"time body gyroscope magnitude  std()"                   
"time body gyroscope jerk magnitude  std()"               
"frequency body acceleration  std() X"                   
"frequency body acceleration  std() Y"                    
"frequency body acceleration  std() Z"                   
"frequency body acceleration jerk  std() X"               
"frequency body acceleration jerk  std() Y"              
"frequency body acceleration jerk  std() Z"               
"frequency body gyroscope  std() X"                      
"frequency body gyroscope  std() Y"                       
"frequency body gyroscope  std() Z"                      
"frequency body acceleration magnitude  std()"            
"frequency body body acceleration jerk magnitude  std()" 
"frequency body body gyroscope magnitude  std()"          
"frequency body body gyroscope jerk magnitude  std()"

More information on each variable can be found on the "features_info.txt" or "features.txt" files in the data for the project.
Also, information about the experiment can be found on the "README.txt" file in the same data.
The data can be downloaded from: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Data description:
The data provided for this project is from the "Human Activity Recognition Using Smartphones Dataset".
The dataset provides the necessery information about an experiment regarding the functionality of the Samsung Galaxy S II. The subjects performed a set of activities and the data from various measurements devices was collected and computed to two data sets called "test" and "train".

Cleanning up the data:
As instructed, the data from both data sets,"train" and "test", were merged and only the measurments on the mean and standard deviation for each measurement was extracted. Then the activity names and the veriable names were properly described. Lastly, the average of each variable, was taken for each activity performed by each subject.