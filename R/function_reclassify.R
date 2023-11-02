#' This function cleans the data by making a correction to the animals classification
#'
#'Using this function alows the user to correct their class column from three categories (hatching, juvenile, and adult) to four categories (hatching, juvenile, subadult, and adult).
#'This function does not delete the original column, rather adds a NewClass column with the updated classification. 
#'
#'@param data the dataset being used, should be .csv
#'@param column_name The name of the column to be altered
#'@param new_column the name of the new column where the subclasses will be housed
#'@return a mutated dataset with a new column containing new subclasses
#'
#'@export 
#'


reclassify <- function(data, column_name, new_column) {
  data <- data %>%
    mutate({{new_column}} := case_when(
      .data[[column_name]] < 30 ~ "Hatchling",
      .data[[column_name]] >= 30 & .data[[column_name]] <= 119 ~ "Juvenile",
      .data[[column_name]] >= 120 & .data[[column_name]] <= 180 ~ "Subadult",
      .data[[column_name]] > 180 ~ "Adult",
      TRUE ~ "Unknown"
    ))
  return(data)
}


