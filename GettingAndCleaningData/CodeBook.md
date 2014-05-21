## Human Activity Recognition using Smart Phones - Code Book
### Data Set:
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed the following six activities wearing a smartphone (Samsung Galaxy S II) on the waist.
* WALKING
* WALKING_UPSTAIRS
* WALKING_DOWNSTAIRS
* SITTING
* STANDING
* LAYING 

Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected 
for generating the training data and 30% the test data. The data set is availabe at https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

### Data Attribute Information:
For each record in the dataset it is provided: 
* Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration. 
* Triaxial Angular velocity from the gyroscope. 
* A 561-feature vector with time and frequency domain variables. 
* Its activity label. 
* An identifier of the subject who carried out the experiment.

### Data Transformation:
The run_analysis.R script performs the following steps:
  * Reads the activities from the file activity_labels.txt into "activities" data frame - 6 activities
  * Reads the features from the file features.txt into "features" data frame - 561 features
  * Reads the following files from the "test" directory into 3 different data frames
    * subject_test.txt
    * X_test.txt
    * Y_test.txt
  * Assigns labels as "acivitiies" for the levels in Y_test.
  * Creates "testData" data frame by adding Activities, Subject and x_test columns.
  * Reads the following files from the "train" directory into 3 different data frames
    * subject_train.txt
    * X_train.txt
    * Y_train.txt
  * Assigns labels as "acivitiies" for the levels in Y_train.
  * Creates "trainData" data frame by adding Activities, Subject and x_test columns.
  *  
Only mean and standard deviation measures are used to get the average across the Subjects and Activity Levels. These two attributes are factors:

  * Subjects: ( 30 Subject )
  * Activity Labels: ( 6 Activites )

### Analysis Variables

<table>
<thead><tr>
<th>Variable</th>
<th>Descritpion</th>
</tr></thead>
<tbody>
<tr>
<td>Activity</td>
<td>The activity peformed.</td>
</tr>
<tr>
<td>Subject</td>
<td>The ID of the subject.</td>
</tr>
<tr>
<td>tBodyAcc-mean()-X</td>
<td>Mean time for acceleration of body for X direction.</td>
</tr>
<tr>
<td>tBodyAcc-mean()-Y</td>
<td>Mean time for acceleration of body for Y direction.</td>
</tr>
<tr>
<td>tBodyAcc-mean()-Z</td>
<td>Mean time for acceleration of body for Z direction.</td>
</tr>
<tr>
<td>tBodyAcc-std()-X</td>
<td>Standard deviation of time for acceleration of body for X direction.</td>
</tr>
<tr>
<td>tBodyAcc-std()-Y</td>
<td>Standard deviation of time for acceleration of body for Y direction.</td>
</tr>
<tr>
<td>tBodyAcc-std()-Z</td>
<td>Standard deviation of time for acceleration of body for Z direction.</td>
</tr>
<tr>
<td>tGravityAcc-mean()-X</td>
<td>Mean time of acceleration of gravity for X direction.</td>
</tr>
<tr>
<td>tGravityAcc-mean()-Y</td>
<td>Mean time of acceleration of gravity for Y direction.</td>
</tr>
<tr>
<td>tGravityAcc-mean()-Z</td>
<td>Mean time of acceleration of gravity for Z direction.</td>
</tr>
<tr>
<td>tGravityAcc-std()-X</td>
<td>Standard deviation of time of acceleration of gravity for X direction.</td>
</tr>
<tr>
<td>tGravityAcc-std()-Y</td>
<td>Standard deviation of time of acceleration of gravity for Y direction.</td>
</tr>
<tr>
<td>tGravityAcc-std()-Z</td>
<td>Standard deviation of time of acceleration of gravity for Z direction.</td>
</tr>
<tr>
<td>tBodyAccJerk-mean()-X</td>
<td>Mean time of body acceleration jerk for X direction.</td>
</tr>
<tr>
<td>tBodyAccJerk-mean()-Y</td>
<td>Mean time of body acceleration jerk for Y direction</td>
</tr>
<tr>
<td>tBodyAccJerk-mean()-Z</td>
<td>Mean time of body acceleration jerk for Z direction</td>
</tr>
<tr>
<td>tBodyAccJerk-std()-X</td>
<td>Standard deviation of time of body acceleration jerk for X direction.</td>
</tr>
<tr>
<td>tBodyAccJerk-std()-Y</td>
<td>Standard deviation of time of body acceleration jerk for Y direction.</td>
</tr>
<tr>
<td>tBodyAccJerk-std()-Z</td>
<td>Standard deviation of time of body acceleration jerk for Z direction.</td>
</tr>
<tr>
<td>tBodyGyro-mean()-X</td>
<td>Mean body gyroscope measurement for X direction.</td>
</tr>
<tr>
<td>tBodyGyro-mean()-Y</td>
<td>Mean body gyroscope measurement for Y direction.</td>
</tr>
<tr>
<td>tBodyGyro-mean()-Z</td>
<td>Mean body gyroscope measurement for Z direction.</td>
</tr>
<tr>
<td>tBodyGyro-std()-X</td>
<td>Standard deviation of body gyroscope measurement for X direction.</td>
</tr>
<tr>
<td>tBodyGyro-std()-Y</td>
<td>Standard deviation of body gyroscope measurement for Y direction.</td>
</tr>
<tr>
<td>tBodyGyro-std()-Z</td>
<td>Standard deviation of body gyroscope measurement for Z direction.</td>
</tr>
<tr>
<td>tBodyGyroJerk-mean()-X</td>
<td>Mean jerk signal of body for X direction.</td>
</tr>
<tr>
<td>tBodyGyroJerk-mean()-Y</td>
<td>Mean jerk signal of body for Y direction.</td>
</tr>
<tr>
<td>tBodyGyroJerk-mean()-Z</td>
<td>Mean jerk signal of body for Z direction.</td>
</tr>
<tr>
<td>tBodyGyroJerk-std()-X</td>
<td>Standard deviation of jerk signal of body for X direction.</td>
</tr>
<tr>
<td>tBodyGyroJerk-std()-Y</td>
<td>Standard deviation of jerk signal of body for Y direction.</td>
</tr>
<tr>
<td>tBodyGyroJerk-std()-Z</td>
<td>Standard deviation of jerk signal of body for Z direction.</td>
</tr>
<tr>
<td>tBodyAccMag-mean()</td>
<td>Mean magnitude of body Acc</td>
</tr>
<tr>
<td>tBodyAccMag-std()</td>
<td>Standard deviation of magnitude of body Acc</td>
</tr>
<tr>
<td>tGravityAccMag-mean()</td>
<td>Mean gravity acceleration magnitude.</td>
</tr>
<tr>
<td>tGravityAccMag-std()</td>
<td>Standard deviation of gravity acceleration magnitude.</td>
</tr>
<tr>
<td>tBodyAccJerkMag-mean()</td>
<td>Mean magnitude of body acceleration jerk.</td>
</tr>
<tr>
<td>tBodyAccJerkMag-std()</td>
<td>Standard deviation of magnitude of body acceleration jerk.</td>
</tr>
<tr>
<td>tBodyGyroMag-mean()</td>
<td>Mean magnitude of body gyroscope measurement.</td>
</tr>
<tr>
<td>tBodyGyroMag-std()</td>
<td>Standard deviation of magnitude of body gyroscope measurement.</td>
</tr>
<tr>
<td>tBodyGyroJerkMag-mean()</td>
<td>Mean magnitude of body body gyroscope jerk measurement.</td>
</tr>
<tr>
<td>tBodyGyroJerkMag-std()</td>
<td>Standard deviation of magnitude of body body gyroscope jerk measurement.</td>
</tr>
<tr>
<td>fBodyAcc-mean()-X</td>
<td>Mean frequency of body acceleration for X direction.</td>
</tr>
<tr>
<td>fBodyAcc-mean()-Y</td>
<td>Mean frequency of body acceleration for Y direction.</td>
</tr>
<tr>
<td>fBodyAcc-mean()-Z</td>
<td>Mean frequency of body acceleration for Z direction.</td>
</tr>
<tr>
<td>fBodyAcc-std()-X</td>
<td>Standard deviation of frequency of body acceleration for X direction.</td>
</tr>
<tr>
<td>fBodyAcc-std()-Y</td>
<td>Standard deviation of frequency of body acceleration for Y direction.</td>
</tr>
<tr>
<td>fBodyAcc-std()-Z</td>
<td>Standard deviation of frequency of body acceleration for Z direction.</td>
</tr>
<tr>
<td>fBodyAccJerk-mean()-X</td>
<td>Mean frequency of body accerlation jerk for X direction.</td>
</tr>
<tr>
<td>fBodyAccJerk-mean()-Y</td>
<td>Mean frequency of body accerlation jerk for Y direction.</td>
</tr>
<tr>
<td>fBodyAccJerk-mean()-Z</td>
<td>Mean frequency of body accerlation jerk for Z direction.</td>
</tr>
<tr>
<td>fBodyAccJerk-std()-X</td>
<td>Standard deviation frequency of body accerlation jerk for X direction.</td>
</tr>
<tr>
<td>fBodyAccJerk-std()-Y</td>
<td>Standard deviation frequency of body accerlation jerk for Y direction.</td>
</tr>
<tr>
<td>fBodyAccJerk-std()-Z</td>
<td>Standard deviation frequency of body accerlation jerk for Z direction.</td>
</tr>
<tr>
<td>fBodyGyro-mean()-X</td>
<td>Mean frequency of body gyroscope measurement for X direction.</td>
</tr>
<tr>
<td>fBodyGyro-mean()-Y</td>
<td>Mean frequency of body gyroscope measurement for Y direction.</td>
</tr>
<tr>
<td>fBodyGyro-mean()-Z</td>
<td>Mean frequency of body gyroscope measurement for Z direction.</td>
</tr>
<tr>
<td>fBodyGyro-std()-X</td>
<td>Standard deviation frequency of body gyroscope measurement for X direction.</td>
</tr>
<tr>
<td>fBodyGyro-std()-Y</td>
<td>Standard deviation frequency of body gyroscope measurement for Y direction.</td>
</tr>
<tr>
<td>fBodyGyro-std()-Z</td>
<td>Standard deviation frequency of body gyroscope measurement for Z direction.</td>
</tr>
<tr>
<td>fBodyAccMag-mean()</td>
<td>Mean frequency of body acceleration magnitude.</td>
</tr>
<tr>
<td>fBodyAccMag-std()</td>
<td>Standard deviation of frequency of body acceleration magnitude.</td>
</tr>
<tr>
<td>fBodyBodyAccJerkMag-mean()</td>
<td>Mean frequency of body acceleration jerk magnitude.</td>
</tr>
<tr>
<td>fBodyBodyAccJerkMag-std()</td>
<td>Standard deviation of frequency of body acceleration jerk magnitude.</td>
</tr>
<tr>
<td>fBodyBodyGyroMag-mean()</td>
<td>Mean frequency of magnitude of body gyroscope measurement.</td>
</tr>
<tr>
<td>fBodyBodyGyroMag-std()</td>
<td>Standard deviation of frequency of magnitude of body gyroscope measurement.</td>
</tr>
<tr>
<td>fBodyBodyGyroJerkMag-mean()</td>
<td>Mean frequency of magnitude of body gyroscope jerk measurement.</td>
</tr>
</tbody>
</table>
