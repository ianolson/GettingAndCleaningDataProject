# Description of data set:
	==================================================================
	Human Activity Recognition Using Smartphones Dataset
	Version 1.0
	==================================================================
	Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
	Smartlab - Non Linear Complex Systems Laboratory
	DITEN - Università degli Studi di Genova.
	Via Opera Pia 11A, I-16145, Genoa, Italy.
	activityrecognition@smartlab.ws
	www.smartlab.ws
	==================================================================

	The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

	The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

	For each record it is provided:
	======================================

	- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
	- Triaxial Angular velocity from the gyroscope. 
	- A 561-feature vector with time and frequency domain variables. 
	- Its activity label. 
	- An identifier of the subject who carried out the experiment.

	Notes: 
	======
	- Features are normalized and bounded within [-1,1].
	- Each feature vector is a row on the text file.

	For more information about this dataset contact: activityrecognition@smartlab.ws

	License:
	========
	Use of this dataset in publications must be acknowledged by referencing the following publication [1] 

	[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

	This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

	Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.

# Decription of the variables, data, and transformations used to generate tidy_data.txt with the script run_analysis.R:

	The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

	Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 
	
	Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

	These signals were used to estimate variables of the feature vector for each pattern:  
	'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

	mean data are the average for that measurement, and std are the standard deviation for that measurement.

# Data fransformation:

	run_analysis.R combines the data from the test and train data sets, first binding the subject, data, and activity columns (subject_train.txt, X_train.txt, and y_train.txt for the train data set, subject_test.txt, X_test.txt, and y_test.txt for the test data set), then binding the rows from these two data sets.

	Column names are assigned from the features.txt file.

	As we are only interested in the mean and standard deviation data, these columns are subsetted from the complete data set.

	The activity names are merged in based on the Activity_ID column (originally y_XXX.txt) -- This is added to follow the instructions for this exercise, though it is removed immediately to allow calculation of averages.

	This data set is then split by subject and activity, and the average is computed for each variable for each unique subject + activity combination.

	Activity names are merged back into the averaged data set, and columns are sorted in the new tidy_data data frame for usability, in the order below:	
	

# run_analysis.R produces a table with the following columns:
	Subject - Numeric identifier for the subject for whom data was collected
	Activity - Subject activity during data collection. (WALKING
, WALKING_UPSTAIRS
, WALKING_DOWNSTAIRS
, SITTING
, STANDING
, LAYING
)
	-- The following columns are the average of each variable for a given subject and activity. See the descriptions above for more information about these columns.
	tBodyAcc.mean-X
	tBodyAcc.mean-Y
	tBodyAcc.mean-Z
	tGravityAcc.mean-X
	tGravityAcc.mean-Y
	tGravityAcc.mean-Z
	tBodyAccJerk.mean-X
	tBodyAccJerk.mean-Y
	tBodyAccJerk.mean-Z
	tBodyGyro.mean-X
	tBodyGyro.mean-Y
	tBodyGyro.mean-Z
	tBodyGyroJerk.mean-X
	tBodyGyroJerk.mean-Y
	tBodyGyroJerk.mean-Z
	tBodyAccMag.mean
	tGravityAccMag.mean
	tBodyAccJerkMag.mean
	tBodyGyroMag.mean
	tBodyGyroJerkMag.mean
	fBodyAcc.mean-X
	fBodyAcc.mean-Y
	fBodyAcc.mean-Z
	fBodyAccJerk.mean-X
	fBodyAccJerk.mean-Y
	fBodyAccJerk.mean-Z
	fBodyGyro.mean-X
	fBodyGyro.mean-Y
	fBodyGyro.mean-Z
	fBodyAccMag.mean
	fBodyAccJerkMag.mean
	fBodyGyroMag.mean
	fBodyGyroJerkMag.mean
	tBodyAcc.std-X
	tBodyAcc.std-Y
	tBodyAcc.std-Z
	tGravityAcc.std-X
	tGravityAcc.std-Y
	tGravityAcc.std-Z
	tBodyAccJerk.std-X
	tBodyAccJerk.std-Y
	tBodyAccJerk.std-Z
	tBodyGyro.std-X
	tBodyGyro.std-Y
	tBodyGyro.std-Z
	tBodyGyroJerk.std-X
	tBodyGyroJerk.std-Y
	tBodyGyroJerk.std-Z
	tBodyAccMag.std
	tGravityAccMag.std
	tBodyAccJerkMag.std
	tBodyGyroMag.std
	tBodyGyroJerkMag.std
	fBodyAcc.std-X
	fBodyAcc.std-Y
	fBodyAcc.std-Z
	fBodyAccJerk.std-X
	fBodyAccJerk.std-Y
	fBodyAccJerk.std-Z
	fBodyGyro.std-X
	fBodyGyro.std-Y
	fBodyGyro.std-Z
	fBodyAccMag.std
	fBodyAccJerkMag.std
	fBodyGyroMag.std
	fBodyGyroJerkMag.std