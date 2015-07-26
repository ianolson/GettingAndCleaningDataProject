# GettingAndCleaningDataProject
Project for the Coursera Getting and Cleaning Data Course

# Overview
R script to clean and organize data from the Human Activity Recognition Using Smartphones Dataset.

# This script uses data from the following website:
- Description of data: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 
- Data source: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

# Files
- README.md - This document
- CodeBook.md - Overview of the data and description of the processing used to generate tidy_data.txt
- run_analysis.R - R script that parses the source data files, and combines the data into a single flat, tidy data structure according to the following steps:
- tidy_data.txt - Tidy data set with a single row per subject + activity combination, displaying the average value for each measurement. See the CodeBook.md file for more details