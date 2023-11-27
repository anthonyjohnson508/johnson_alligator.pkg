#' This function will be used to calculate the length to leukocyte ratio. 
#'
#'The ratio is calculated by dividing the HL ratio by total length. 
#'The new data is housed in a column titled L_L_Ratio.
#'
#'@param data the data set being used, should be .csv
#'@param column_a is the numerator in the equation, this should be the column where your HL ratios are housed.
#'@param column_b is the denominator in the equation, this should be the column where your total lengths are housed. 
#'@return a mutated data set that adds an additional column titled L_L_Ratio, this is the HL ratio divided by the total length.
#'
#'@export 
#'


calc_length_leukocyte_ratio <- function(data, column_a, column_b) {
  LLratio_calculation <- data[[column_a]] / data[[column_b]]
  
  if (any(!is.finite(LLratio_calculation))) {
    warning("Mathematical calculation may contain non-finite values. Please verify.")
  } else {
    message("No non-numeric or infinite values detected.")
  }
  
  data$L_L_Ratio <- LLratio_calculation
  
  return(data)
}


##Run and test function
#alligators_reclassify <- calc_length_leukocyte_ratio(alligators_reclassify, "H_L_Ratio", "TL")
#head(alligators_reclassify)

