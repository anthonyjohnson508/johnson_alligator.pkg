#' This function cleans the data by making a correction to the alligator size classification.
#'
#'Using this function allows the user to correct their class column from three categories (hatching, juvenile, and adult) to four categories (hatching, juvenile, sub-adult, and adult).
#'This function does not delete the original column, rather adds a "NewClass" column with the updated classification. 
#'
#'@param data the data set being used, it should be in .csv format.
#'@param column_name The name of the column to be altered.
#'@param new_column the name of the new column where the subclasses will be housed.
#'@return a mutated data set with a new column containing the new subclass data.
#'
#'@export 
#'


##load packages, note tidyverse covers many of these
#library(tidyverse) 
#library(ggplot2)
#library(dplyr)
#library(broom)
#library(knitr)
##first load your data
#alligators <- read.csv("Data/Alligator_Fake_Data_V2.csv")

##check data set
#head(alligators)


reclassify <- function(data, column_name) {
  data <- data %>%
    mutate(NewClass := case_when(
      .data[[column_name]] < 30 ~ "Hatchling",
      .data[[column_name]] >= 30 & .data[[column_name]] <= 119 ~ "Juvenile",
      .data[[column_name]] >= 120 & .data[[column_name]] <= 180 ~ "Subadult",
      .data[[column_name]] > 180 ~ "Adult",
      TRUE ~ "Unknown"
    ))
  
  correct <- "Subadult" %in% data$NewClass
  if (correct) {
    message("Reclassification is correct!")
  } else {
    warning("Reclassification may contain errors.")
  }
  
  return(data)
}



##Run and test function to see if it worked
#alligators_reclassify <- reclassify(alligators, column_name = "TL")
#head(alligators_reclassify)
