# Pancreatic_Cancer_Project

## Overview

For this project we will be analyzing the urine test results of individuals who participated in a pancreatic cancer clinical study, published in 2020. Previously, there were thought to be three essential urinary biomarkers, used in a panel, to help identify and diagnose pancreatic cancer. This study aims to validate the use of a fourth  biomarker, in order to make the panel more efficient. Our goal is to use the data to test if adding the fourth biomarker in fact makes the panel more accurate. Through the use of supervised machine learning we will be able to predict and differentiate, with a higher level of confidence, which individuals have pancreatic cancer compared to healthier individuals. We will then visualize our results in a Tableau dashboard.

## Roles

Github Maintenace, Google Slides - Andrew Surace
Database, Dashboard - Erica Eidelman
Machine Learning Model - Brittany Garrett

## Data Exploration

The data set for this project came from Kaggle in the form of a csv file providing levels of four urinary biomarkers, as well as creatinine and blood plasma levels, for British and Spanish patients falling into one of three groups: control group, patients with benign hepatobiliary conditions, and patients with pancreatic cancer. We stored this data in a database using pgAdmin. For the initial stages of data exploration, we created summary tables showing average levels of the markers for patients across different genders, diagnosis groups, and stages of cancer. These tables were later used to make summary bar graphs using the Python Pyplot library. 

## Data Analysis

Data analysis was done in the form of a supervised machine learning model, using logistic regression to perform binary classification answering the question of whether a patient with certain levels of the markers does or does not have cancer. Preprocessing included removing columns irrelevant to the analysis, such as whether the patient sample was used in a previous study or the tissue bank the sample came from. While the logistic regression model is easy to train and interpret, which works for the purposes of saying whether a patient has cancer or not, it can only provide one of two answer choices, so a limitation is that it cannot be used to differentiate whether non-cancer patients are truly healthy or have a benign condition.

## Machine Learning
### Overview:
After dropping unnecessary columns/data, SciKitLearn is the library we'll be using to create a classifier. Our data will be split into training and testing data sets. The training set will then be fit into a Logistic Regression classifier.

### Description of preliminary data preprocessing
Preprocessing for the data included dropping unnecessary columns (sample_id, patient_cohort, sample_origin, plasma_CA19_9, benign_sample_diagnosis), dropping null values from REG1B and REG1A, and checking the data types of the remaining columns. Object datatypes were then converted to int64 by use of OneHotEncoder. These new data type columns were then merged back into the original dataframe. 

### Description of preliminary feature engineering and preliminary feature selection, including their decision-making process 
The preliminary features we decided to use all of the markers that could be influential in a urinalysis for diagnosis. These features included age, diagnosis, creatine, LYVE1, TFF1, sex, stage, and either REG1A, REG1B, or plasma. 

### Description of training and testing sets 
Training and testing sets were split up using the train test split module of the SKLearn Library, the default settings were left in place.The model was trained using a dataset from the study regarding urinalysis and pancreatic cancer. The model was run using the different biomarkers mentioned before (REG1A, REG1B, and plasma). The model was trained changing the depth parameters of RandomForest, adjusting other parameters in the model (Sex, Stage, Creatine). The model would benefit in the future from continued training with more data from future studies. We reached out to the authors of the current study to see if there was additional data, however we did not receive a reply. 

### Explanation of model choice
The model used was a supervised machine learning model since we knew that our target outcome was to predict the diagnosis of pancreatic cancer in a patient based on urinalysis. 

We used RandomForest and ran four different models with 2 or 3 different outcomes for a total of 8 different models. The output would show yes, a patient has markers consistent with a pancreatic cancer diagnosis, vs. no, a patient does not have markers consistent with a pancreatic cancer diagnosis in the models ran with 2 outcomes. The models with 3 outcomes would show 1. a patient is healthy and has no evidence of disease, 2. A patient has a benign pancreatic disease, 3. A patient has a malignant pancreatic disease (Pancreatic Cancer).

A limitation of the RandomForest model is that it can overfit the data and sometimes does not work well or get good results for small data sets because the randomness is reduced. The benefit to using the RandomForest model is that it can be used to solve both a classification and regression problem and that it automatically handles missing values. 

### Changes in model choice:

Updates to the model have included:
- use of RandomForest classifier instead of using LogisticRegression.
- using 2 diagnoses (No Cancer vs. Cancer)
- using 3 diagnoses output (No Issue, Benign Disease, vs. Cancer)

Originally we used a Logistic Regression model for our machine learning model that had 2 outcomes (No cancer vs. cancer). We found that the Logistric Regression model did not perform well when we took away certain information that could influence the data such as stage and benign disease diagnosis. This led us to try the RandomForest Classifier which had better results. 

### Description of current accuracy score
The current overall accuracy scores are as followed for the three models with use of 2 diagnosis output:
REG1A = 0.63 (Cancer Diagnostic accuracy: 0.6)
REG1B = 0.73 (Cancer Diagnostic accuracy: 0.63)
Plasma = 0.89 (Cancer Diagnostic accuracy: 0.87)
All biomarkers = 0.93 (Cancer Diagnostic accuracy: 0.97)

The current accuracy scores are as followed for the three models with use of 3 diagnosis output:
REG1A = 0.52 (Cancer Diagnostic accuracy: 0.61)
REG1B = 0.53 (Cancer Diagnostic accuracy: 0.57)
Plasma = 0.73 (Cancer Diagnostic accuracy: 0.87)
All biomarkers = 0.84 (Cancer Diagnostic accuracy: 0.89)

These accuracy scores show that Plasma is the most accurate in its ability to detect cancer at 0.73 (3 diagnosis output) and 0.89 (2 diagnosis output) and that REG1A ad REG1B had an accuracy of 0.5 with the 3 diagnosis output model and 0.63 and 0.73 with the 2 dignosis output model. This shows that the use of urinalysis may not be the best indicator for early diagnosis of malignant pancreatic disease.

## Google Slides
https://docs.google.com/presentation/d/1V8TzO3QotAER8gG7yoSA2JqWCj4eC4TSSbygPTdOyhM/edit?usp=sharing

## Tableau Dashboard
https://public.tableau.com/app/profile/ee1691/viz/PancreaticCancerDashboard/Dashboard1?publish=yes
