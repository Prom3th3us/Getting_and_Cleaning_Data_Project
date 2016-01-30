---
title: "Human Activity Recognition Using Smartphones Dataset Version 1.0 - Tidy Dataset"
author: "Tim Collart"
date: "January 29, 2016"
---

---


Original authors of the dataset:
================================
Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.

Smartlab - Non Linear Complex Systems Laboratory

DITEN - Università degli Studi di Genova.

Via Opera Pia 11A, I-16145, Genoa, Italy.

activityrecognition@smartlab.ws

www.smartlab.ws

---

This tidy dataset was built from the Human Activity Recognition Using Smartphones Data Set Version 1.

A full description of the raw dataset as well as the appropriate citations can be found [here](https://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)


---


For more information about this dataset contact: activityrecognition@smartlab.ws

---


The tidy dataset includes the following files:
=====================================================
- 'README.md'
- 'run_analysis.R': An R script that will download the raw dataset (from [here]( https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)) if not already in the directory and extract the tidy dataset.
- 'tidy_full.csv': The first tidy dataset containing measurements on the mean and the standard deviation of each feature. For more information please look at 'codebook.md'
- 'tidy_average.csv': The second tidy dataset created from the first. It contains the average of each feature for each activity and each subject. For more information please look at 'codebook.md'

---


License:
========
Use of this dataset in publications must be acknowledged by referencing the following publication [1] 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.