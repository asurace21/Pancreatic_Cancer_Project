# Pancreatic_Cancer_Project

### Overview of Machine Learning Model

After dropping unnecessary columns/data, SciKitLearn is the library we'll be using to create a classifier. Our data will be split into training and testing data sets. The training set will then be fit into a Logistic Regression classifier.

### Description of preliminary data preprocessing

Preprocessing for the data included dropping unnecessary columns (sample_id, patient_cohort, sample_origin, plasma_CA19_9, benign_sample_diagnosis), dropping null values from REG1B and REG1A, and checking the data types of the remaining columns. Object datatypes were then converted to int64 by use of OneHotEncoder. These new data type columns were then merged back into the original dataframe. 

### Description of preliminary feature engineering and preliminary feature selection, including their decision-making process 

The preliminary features we decided to use all of the markers that could be influential in a urinalysis for diagnosis. These features included age, diagnosis, creatine, LYVE1, TFF1, sex, stage, and either REG1A, REG1B, or plasma. 

### Description of how data was split into training and testing sets 

Training and testing sets were split up using a 

### Explanation of model choice, including limitations and benefits 

The model used was a supervised machine learning model since we knew that out target outcome was that we are trying to predict the diagnosis of pancreatic cancer in a patient based on urinalysis. 

We used a logistic regression model to so the output would show yes, a patient has markers consistent with a pancreatic cancer diagnosis, vs. no, a patient does not have markers consistent with a pancreatic cancer diagnosis. 

A limitation of the logistic regression model is that it does not allow us to differentiate the stage of cancer or if a patient has a benign disease that the urinalysis is picking up on since there are only two possible outcomes from the training model.

The benefit to using the logistic regression model is that it is easy to interpret and train. Logistic regression is also a good tool to be used for classification purposes which is what we want from the model. 
