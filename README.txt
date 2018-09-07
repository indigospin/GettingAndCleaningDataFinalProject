==================================================================

Getting and Cleaning Data Final Project README
9/5/2018

==================================================================

This GitHub repository contains all of the files relevant to the final project for the ‘Getting and Cleaning Data’ course, the goal of which was to convert a raw data set into a tidy, summarized data set.  These files include:

 - ‘README.txt’ - This README file, which describes the contents of this GitHub repository, as well as the analysis process.

 - ‘codebook.Rmd’ - An R Markdown file comprising the codebook for the tidy data set, which describes the raw data, the tidy data, the analysis process, and all named variables.

 - ‘tidy_data_set_of_averages.txt’ - A text table containing the final, tidy data set.

 - ‘run_analysis.R’ - An R script that converts the original, raw data set into the final, tidy, summarized data set.  (See below for a more detailed description of how this script works.)

==================================================================

How the ‘run_analysis.R’ Script Works

==================================================================

The ‘run_analysis.R’ script converts the original, raw data set into the final, tidy, summarized data set.  This is accomplished in six major steps:


1.  Raw variable names are imported and converted to descriptive, readable variable names.


    Lines 3-4 import and store variable names from the raw data set.
    Lines 5-60 systematically convert the original variable names to descriptive,
        readable variable names (e.g. ‘tBodyAcc-mean()-X’ becomes
        ‘mean_time_domain_signal_of_body_acceleration_along_the_x_axis’).


2.  Raw test set data, subjects, and activity values are imported and bound together into columns.  Raw activity values are given descriptive, readable names.


    Lines 64-65 import and store test subjects from the raw test data set.
    Lines 66-67 import and store activities from the raw test data set.
    Lines 68-73 convert the original activity names to descriptive activity names (e.g.
        ‘1’ becomes ‘walking’).
    Lines 74-75 import and store variable measurements from the raw test data set.
    Lines 76-77 combines subjects, activities, variable measurements, and variable names
        into a single test set data frame (‘testsetfull’).
    Line 78 removes several stored objects to save memory.


3.  Raw training set data, subjects, and activity values are imported and bound together into columns.  Raw activity values are given descriptive, readable names.


    Lines 82-83 import and store test subjects from the raw training data set.
    Lines 84-85 import and store activities from the raw training data set.
    Lines 86-91 convert the original activity names to descriptive activity names (e.g.
        ‘1’ becomes ‘walking’).
    Lines 92-93 import and store variable measurements from the raw training data set.
    Lines 94-95 combines subjects, activities, variable measurements, and variable names
        into a single training set data frame (‘trainsetfull’).
    Line 96 removes several stored objects to save memory.


4.  Test and training data sets are merged to form a single data set.


    Line 100 combines the test set data frame and training set data frame into a single,
        merged data frame (‘datamerged’).
    Line 101 orders this new data frame by test subject.
    Line 102 converts test subjects from integers to factors for later grouping.


5.  Subjects, activities, and variables consisting of mean and standard deviation measurements are extracted to form a new, reduced data set.


    Lines 106-107 extract the subjects, activities, and variables consisting of mean and
        standard deviation measurements from ‘datamerged’.  This subset of data is saved
        as a new data frame (‘datameanstd’).


6.  This new, reduced data set is grouped by subject and activity, summarized to give average values of each variable, and exported as a tidy .txt data table.


    Line 111 loads the ‘dplyr’ package for downstream data manipulation and analysis.
    Line 113 converts the ‘datameanstd’ data frame into a ‘tibble’ object
        (‘datameanstdtbl’).
    Line 114 creates the final, tidy, summarized data set (‘finalsummary’) by piping
        ‘datameanstdtbl’ through a series of ‘dplyr’ functions.  The data are grouped by
        subject and activity, and all numeric variables are summarized across trials using
        the ‘mean’ function.
    Line 116 exports ‘finalsummary’ to a .txt table file
        (‘tidy_data_set_of_averages.txt’).