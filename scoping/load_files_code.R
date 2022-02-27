#### Author: Christa Chiao
# This is some helper code to load the data in a standard way so that the
# code that we write is as interchangeable as possible.
# ie. standard data frame names.

library(dplyr)
library(stringr)

# if the files are in a different location than your working directory, change
# the file path in the list.files function
file_names <- list.files()

# read all 13 csvs into a list called "all_csvs"
all_csvs <- lapply(file_names, read.csv)

# Set the name of each list element to its respective file name.
names(all_csvs) <- gsub(".csv","",
                        list.files(full.names = FALSE),
                        fixed = TRUE)

# break list out into separate dfs
list2env(all_csvs, envir=.GlobalEnv)
