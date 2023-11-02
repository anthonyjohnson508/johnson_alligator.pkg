#' This function will be used to calculate the length to leukocyte ratio. 
#'
#'ratio is calculated by dividing the HL ratio by total length.
#'
#'
#'@param data the data set being used, should be .csv
#'@param column_a is the numerator in the equation, this should be the column where your HL ratios are housed.
#'@param column_b is the denominator in the equation, this should be the column where your total lengths are housed. 
#'@return a mutated data set that adds an additional column titled L_L_Ratio, this is the HL ratio divided by the total length.
#'
#'@export 
#'


calc_length_leukocyte_ratio <- function(data, column_a, column_b) {
  LLratio_calculation<- data[[column_a]] / data[[column_b]]
  data$L_L_Ratio <- LLratio_calculation
  return(data)
}



#alligators <- calc_length_leukocyte_ratio(alligators, "H_L_Ratio", "TL")


