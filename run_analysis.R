library(tidyr)
library(dplyr)
library(data.table)

## check if the dataset exists, if not download and unzip it.
directory = "UCI HAR Dataset"
if(!file.exists(directory))
{
        temp <- tempfile()
        url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
        download.file(url, temp, mode = "wb")
        unzip(temp)
        rm(temp)
        date_downloaded<-Sys.time()
}

## read all data files from test and train set
## fread doesnt seem to work on the data files so I replaced it by a slower as.data.table(read.table())
feat_names<- fread(file.path(directory,"features.txt"), select = 2, colClasses = "character")
act_labels<-fread(file.path(directory, "activity_labels.txt"))
data_test<- as.data.table(read.table(file.path(directory, "test", "X_test.txt")))
act_test<- fread(file.path(directory, "test", "y_test.txt"))
subj_test<- fread(file.path(directory, "test", "subject_test.txt"))
data_train <- as.data.table(read.table(file.path(directory, "train", "X_train.txt")))
act_train <- fread(file.path(directory, "train", "y_train.txt"))
subj_train <- fread(file.path(directory, "train", "subject_train.txt"))

## add feature names as column names to the data
## add the activity and subject as two new columns
## we also add a column to indicate from which set
## (trainign or test) the data is
setnames(data_test, names(data_test), feat_names[[1]])
setnames(data_train, names(data_train), feat_names[[1]])
data_test[,c("Subject", "A", "Set") := list(subj_test[[1]], act_test[[1]], "test")]
data_train[,c("Subject", "A", "Set") := list(subj_train[[1]], act_train[[1]], "train")]

## add columnames to the activity labels
setnames(act_labels, names(act_labels), c("A", "Activity"))

## finally merge the two data.tables together
merged <- bind_rows(data_test, data_train)

## select only columns with mean and std of the measurements
## in addition to the Subject, A and Set columns
tidy_full<- merged %>% select(contains("mean"), contains("std"), Subject:Set) %>%
## add a new column Activity by matching the integers in A to the Activity labels
## afterwards remove the A column
left_join(act_labels, by="A") %>% select(-A)

## remove all intermediate objects
rm(directory, feat_names,act_labels, data_test, act_test, subj_test, data_train, act_train, subj_train, merged)

## output the full dataset
write.csv(tidy_full, "tidy_full.csv", row.names = F, quote = F)

## calculate the average of each variable for every subject and every activity
tidy_average<- tidy_full %>% select(-Set) %>% group_by(Activity, Subject) %>% summarise_each(funs(mean))
## output the summerised dataset
write.csv(tidy_average, "tidy_average.csv", row.names = F, quote = F)




