## Introduction to run_analysis.R of the peer assessment "Getting and Cleaning Data" 

The run_analysis program read and clean the data from human activity recognition.
parameters:
X1 is training set;
X2 is test set;
Y1 is training labels;
Y2 is test labels;
subTrain is the training subjects;
subTest is the test subjects;
features are features (names) of the activities.

step 1: 
line 4-10 reads the original data;
line 11-13 combine the training set/test set, training label/test label, and training subjects/test subjects, respectively;
line 14-16 give the names of overall features(X), subject(subjects), and activity(Y);

step 3:
line 17-23  applies the activity names from activity_labels.txt to name the activities in the data set;

step 2:
line 24 select the columns of data which contain "mean" or "std" in names;
line 25 picks up the target features we need to collect(mean or std);

step 4:
line 26-35 name cleaning:
f,t ->frequency-domain, time-domain;
acc, gyro -> accelerometer, gyroscope;
Mag -> magnitude;
BodyBody -> body;
Freq -> frequency;

step 5:
line 36-37 combines data set, subjects, and activity code by column;
line 38-39, melt the data by subject and activity first, then use dcast function to calculate the average value of average or mean on variable for each activity and each subject;
line 40 write data to txt file.
