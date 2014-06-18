**Description of the study**

The data was collected in 2012 by researchers at the University of Genoa. It was built from recordings of subjects performing activities of daily living while carrying a waist-mounted smartphone with embedded inertial sensors from the accelerometers from the Samsung Galaxy S smartphone.

The experiments were carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING\_UPSTAIRS, WALKING\_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, the researchers captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments were video-recorded to label the data manually. The obtained dataset was randomly partitioned into two sets, where 21 of the volunteers were selected for generating the training data and 9 for the test data.  
  
  
**Sampling Information**

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force was assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

- Each record in the original dataset provides:
- Tri-axial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Tri-axial Angular velocity from the gyroscope.
- A 561-feature vector with time and frequency domain variables.
- Its activity label.
- An identifier of the subject who carried out the experiment.



**Technical Information**

There were a total of 10299 observations comprised of 2947 from the 9 subjects who provided the test data and 7352 observations from the 21 subjects who provided the training data. The observations are actually summary statistics (means and standard deviations) of recordings of sensor signals.

Our assignment was to process this data and reduce it to a summary dataset that calculates means for each subject and for each activity. The number of columns was reduced to include only those that were labeled with a name that contained stings: _mean()_ or _std()_. Columns that contained the strings _mean_ or _std _, without parentheses immediately following, were not included.



**Structure of Data**

The final result is a 36-row, 66-column dataset called tinyds2.txt, a comma-delimited text file that also includes row descriptions and column names.

**Data Details – tinyds2.txt**

| **New Variable Name** | **Original Variable Name** | **Col#** | **Type** | **Description** | **Units** | **Measure** |
| --- | --- | --- | --- | --- | --- | --- |
| tBodyAccmeanX | tBodyAcc-mean()-X | 1 | Num | Body acceleration | Time | Mean |
| tBodyAccmeanY | tBodyAcc-mean()-Y | 2 | Num | Body acceleration | Time | Mean |
| tBodyAccmeanZ | tBodyAcc-mean()-Z | 3 | Num | Body acceleration | Time | Mean |
| tBodyAccstdX | tBodyAcc-std()-X | 4 | Num | Body acceleration | Time | Std Dev |
| tBodyAccstdY | tBodyAcc-std()-Y | 5 | Num | Body acceleration | Time | Std Dev |
| tBodyAccstdZ | tBodyAcc-std()-Z | 6 | Num | Body acceleration | Time | Std Dev |
| tGravityAccmeanX | tGravityAcc-mean()-X | 7 | Num | Gravity acceleration | Time | Mean |
| tGravityAccmeanY | tGravityAcc-mean()-Y | 8 | Num | Gravity acceleration | Time | Mean |
| tGravityAccmeanZ | tGravityAcc-mean()-Z | 9 | Num | Gravity acceleration | Time | Mean |
| tGravityAccstdX | tGravityAcc-std()-X | 10 | Num | Gravity acceleration | Time | Std Dev |
| tGravityAccstdY | tGravityAcc-std()-Y | 11 | Num | Gravity acceleration | Time | Std Dev |
| tGravityAccstdZ | tGravityAcc-std()-Z | 12 | Num | Gravity acceleration | Time | Std Dev |
| tBodyAccJerkmeanX | tBodyAccJerk-mean()-X | 13 | Num | Body acceleration jerk | Time | Mean |
| tBodyAccJerkmeanY | tBodyAccJerk-mean()-Y | 14 | Num | Body acceleration jerk | Time | Mean |
| tBodyAccJerkmeanZ | tBodyAccJerk-mean()-Z | 15 | Num | Body acceleration jerk | Time | Mean |
| tBodyAccJerkstdX | tBodyAccJerk-std()-X | 16 | Num | Body acceleration jerk | Time | Std Dev |
| tBodyAccJerkstdY | tBodyAccJerk-std()-Y | 17 | Num | Body acceleration jerk | Time | Std Dev |
| tBodyAccJerkstdZ | tBodyAccJerk-std()-Z | 18 | Num | Body acceleration jerk | Time | Std Dev |
| tBodyGyromeanX | tBodyGyro-mean()-X | 19 | Num | Body Gyro | Time | Mean |
| tBodyGyromeanY | tBodyGyro-mean()-Y | 20 | Num | Body Gyro | Time | Mean |
| tBodyGyromeanZ | tBodyGyro-mean()-Z | 21 | Num | Body Gyro | Time | Mean |
| tBodyGyrostdX | tBodyGyro-std()-X | 22 | Num | Body Gyro | Time | Std Dev |
| tBodyGyrostdY | tBodyGyro-std()-Y | 23 | Num | Body Gyro | Time | Std Dev |
| tBodyGyrostdZ | tBodyGyro-std()-Z | 24 | Num | Body Gyro | Time | Std Dev |
| tBodyGyroJerkmeanX | tBodyGyroJerk-mean()-X | 25 | Num | Body Gyro | Time | Mean |
| tBodyGyroJerkmeanY | tBodyGyroJerk-mean()-Y | 26 | Num | Body Gyro | Time | Mean |
| tBodyGyroJerkmeanZ | tBodyGyroJerk-mean()-Z | 27 | Num | Body Gyro | Time | Mean |
| tBodyGyroJerkstdX | tBodyGyroJerk-std()-X | 28 | Num | Body Gyro | Time | Std Dev |
| tBodyGyroJerkstdY | tBodyGyroJerk-std()-Y | 29 | Num | Body Gyro | Time | Std Dev |
| tBodyGyroJerkstdZ | tBodyGyroJerk-std()-Z | 30 | Num | Body Gyro | Time | Std Dev |
| tBodyAccMagmean | tBodyAccMag-mean() | 31 | Num | Body acceleration | Time | Mean |
| tBodyAccMagstd | tBodyAccMag-std() | 32 | Num | Body acceleration | Time | Std Dev |
| tGravityAccMagmean | tGravityAccMag-mean() | 33 | Num | Gravity acceleration | Time | Mean |
| tGravityAccMagstd | tGravityAccMag-std() | 34 | Num | Gravity acceleration | Time | Std Dev |
| tBodyAccJerkMagmean | tBodyAccJerkMag-mean() | 35 | Num | Body acceleration jerk | Time | Mean |
| tBodyAccJerkMagstd | tBodyAccJerkMag-std() | 36 | Num | Body acceleration jerk | Time | Std Dev |
| tBodyGyroMagmean | tBodyGyroMag-mean() | 37 | Num | Body Gyro Mag | Time | Mean |
| tBodyGyroMagstd | tBodyGyroMag-std() | 38 | Num | Body Gyro Mag | Time | Std Dev |
| tBodyGyroJerkMagmean | tBodyGyroJerkMag-mean() | 39 | Num | Body Gyro Mag | Time | Mean |
| tBodyGyroJerkMagstd | tBodyGyroJerkMag-std() | 40 | Num | Body Gyro Mag | Time | Std Dev |
| fBodyAccmeanX | fBodyAcc-mean()-X | 41 | Num | Body acceleration | Freq | Mean |
| fBodyAccmeanY | fBodyAcc-mean()-Y | 42 | Num | Body acceleration | Frequency | Mean |
| fBodyAccmeanZ | fBodyAcc-mean()-Z | 43 | Num | Body acceleration | Frequency | Mean |
| fBodyAccstdX | fBodyAcc-std()-X | 44 | Num | Body acceleration | Frequency | Std Dev |
| fBodyAccstdY | fBodyAcc-std()-Y | 45 | Num | Body acceleration | Frequency | Std Dev |
| fBodyAccstdZ | fBodyAcc-std()-Z | 46 | Num | Body acceleration | Frequency | Std Dev |
| fBodyAccJerkmeanX | fBodyAccJerk-mean()-X | 47 | Num | Body acceleration jerk | Frequency | Mean |
| fBodyAccJerkmeanY | fBodyAccJerk-mean()-Y | 48 | Num | Body acceleration jerk | Frequency | Mean |
| fBodyAccJerkmeanZ | fBodyAccJerk-mean()-Z | 49 | Num | Body acceleration jerk | Frequency | Mean |
| fBodyAccJerkstdX | fBodyAccJerk-std()-X | 50 | Num | Body acceleration jerk | Frequency | Std Dev |
| fBodyAccJerkstdY | fBodyAccJerk-std()-Y | 51 | Num | Body acceleration jerk | Frequency | Std Dev |
| fBodyAccJerkstdZ | fBodyAccJerk-std()-Z | 52 | Num | Body acceleration jerk | Frequency | Std Dev |
| fBodyGyromeanX | fBodyGyro-mean()-X | 53 | Num | Body Gyro | Frequency | Mean |
| fBodyGyromeanY | fBodyGyro-mean()-Y | 54 | Num | Body Gyro | Frequency | Mean |
| fBodyGyromeanZ | fBodyGyro-mean()-Z | 55 | Num | Body Gyro | Frequency | Mean |
| fBodyGyrostdX | fBodyGyro-std()-X | 56 | Num | Body Gyro | Frequency | Std Dev |
| fBodyGyrostdY | fBodyGyro-std()-Y | 57 | Num | Body Gyro | Frequency | Std Dev |
| fBodyGyrostdZ | fBodyGyro-std()-Z | 58 | Num | Body Gyro | Frequency | Std Dev |
| fBodyAccMagmean | fBodyAccMag-mean() | 59 | Num | BodyAccMag | Frequency | Mean |
| fBodyAccMagstd | fBodyAccMag-std() | 60 | Num | BodyAccMag | Frequency | Std Dev |
| fBodyBodyAccJerkMagmean | fBodyBodyAccJerkMag-mean() | 61 | Num | BodyBodyAccJerkMag | Frequency | Mean |
| fBodyBodyAccJerkMagstd | fBodyBodyAccJerkMag-std() | 62 | Num | BodyBodyAccJerkMag | Frequency | Std Dev |
| fBodyBodyGyroMagmean | fBodyBodyGyroMag-mean() | 63 | Num | BodyBodyGyroMag | Frequency | Mean |
| fBodyBodyGyroMagstd | fBodyBodyGyroMag-std() | 64 | Num | BodyBodyGyroMag | Frequency | Std Dev |
| fBodyBodyGyroJerkMagmean | fBodyBodyGyroJerkMag-mean() | 65 | Num | BodyBodyGyroJerkMag | Frequency | Mean |
| fBodyBodyGyroJerkMagstd | fBodyBodyGyroJerkMag-std() | 66 | Num | BodyBodyGyroJerkMag | Frequency | Std Dev |
|  |  |  |  |  |  |  |
| **Row Names** |  | **Row #** | **Type** | **Description** | **Units** |  |
| mean-activity-LAYING |  | 1 | Factor | Activity | Row Name |  |
| mean-activity-SITTING |  | 2 | Factor | Activity | Row Name |  |
| mean-activity-STANDING |  | 3 | Factor | Activity | Row Name |  |
| mean-activity-WALKING |  | 4 | Factor | Activity | Row Name |  |
| mean-activity-WALKING\_DOWNSTAIRS | 5 | Factor | Activity | Row Name |  |
| mean-activity-WALKING\_UPSTAIRS | 6 | Factor | Activity | Row Name |  |
| mean-subID-1:30 |  | 7:36 | Factor | Test Subject | Row Name |  |
