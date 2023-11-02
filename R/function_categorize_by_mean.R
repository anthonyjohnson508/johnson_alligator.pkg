#' This function calculate if the animals total length is above or below the mean
#'
#'this creates a new column titled Size and gives the observation a value of Small or Large depending on if the observation is great or less than the mean. 
#'
#'
#'
#'@param data the data set being used, should be .csv
#'@param column_name this is the column that you wish to perform the analysis on. This should be your total length column. 
#'@return a mutated data set that adds an additional column Size, under the new column each observation will receive a value Large or Small.
#'
#'@export 
#'



create_size_category <- function(data, column_name) {
  mean_value <- mean(data[[column_name]])
  data$Size <- ifelse(data[[column_name]] > mean_value, "Large", "Small")
  
  return(data)
}
