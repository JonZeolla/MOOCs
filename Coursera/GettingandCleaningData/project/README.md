# Coursera - [Getting and Cleaning Data](https://www.coursera.org/learn/data-cleaning/)
## Course Project Description
This is the course project for the Getting and Cleaning Data Coursera course.  The purpose of this project is to demonstrate my ability to collect, work with, and clean a data set.  In order to do so, I have written `run_analysis.R`, which:  
1. Sets up the environment, by loading appropriate libraries.  
2. Downloads and unzips the dataset.  
3. Reads in the appropriate files from the dataset to data frames, and tidies up the column names.  
4. Merges the test and training datasets together, and keeps only the columns which hold standard deviation or mean information.  
5. Creates a final dataset which has the mean value for each variable broken down by subject and activity pair.  

## Notes
Before running the script, ensure you are in the working directory where you'd like the dataset to be downloaded and unzipped, and where you'd like the output to be written.  

## Final output
The final output is in the file `project.txt`.
