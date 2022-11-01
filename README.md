# Pancreatic_Cancer_Project

## Overview

For this project we will be analyzing the urine test results of individuals who participated in a pancreatic cancer clinical study, published in 2020. Previously, there were thought to be three essential urinary biomarkers, used in a panel, to help identify and diagnose pancreatic cancer. This study aims to validate the use of a fourth  biomarker, in order to make the panel more efficient. Our goal is to use the data to test if adding the fourth biomarker in fact makes the panel more accurate. Through the use of supervised machine learning we will be able to predict and differentiate, with a higher level of confidence, which individuals have pancreatic cancer compared to healthier individuals. We will then visualize our results in a Tableau dashboard.

## Data Exploration

The data set for this project came from Kaggle in the form of a csv file providing levels of four urinary biomarkers, as well as creatinine and blood plasma levels, for British and Spanish patients falling into one of three groups: control group, patients with benign hepatobiliary conditions, and patients with pancreatic cancer. We stored this data in a database using pgAdmin. For the initial stages of data exploration, we created summary tables showing average levels of the markers for patients across different genders, diagnosis groups, and stages of cancer. These tables were later used to make summary bar graphs using the Python Pyplot library. 

## Data Analysis

Data analysis was done in the form of a supervised machine learning model, using logistic regression to perform binary classification answering the question of whether a patient with certain levels of the markers does or does not have cancer. Preprocessing included removing columns irrelevant to the analysis, such as whether the patient sample was used in a previous study or the tissue bank the sample came from. While the logistic regression model is easy to train and interpret, which works for the purposes of saying whether a patient has cancer or not, it can only provide one of two answer choices, so a limitation is that it cannot be used to differentiate whether non-cancer patients are truly healthy or have a benign condition.

## Google Slides (draft)
https://docs.google.com/presentation/d/1V8TzO3QotAER8gG7yoSA2JqWCj4eC4TSSbygPTdOyhM/edit?usp=sharing

## Dashboard (overview)
https://docs.google.com/presentation/d/1kNauOyb5hfkX2_CczbgCNyR4u84tCv-Y_2XvuZPimoE/edit#slide=id.p

## Tableau Dashboard
https://public.tableau.com/app/profile/ee1691/viz/PancreaticCancerDashboard/Dashboard1?publish=yes
