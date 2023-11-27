#' This function is used to run an ANOVA.
#'
#'A specific ANOVA that compares the reclassified alligators size classes to their HL ratios.
#'
#'@param data the data set being used, should be .csv
#'@return ANOVA results in a summary table including total and residual Degrees of freedom, Sum of Squares, Mean Squares, F-statistic, and P-value.
#'
#'@export 
#'


ANOVA_HL_Class <- function(data) {
  # Check if 'H_L_Ratio' is numeric
  if (!is.numeric(data$H_L_Ratio)) {
    stop("ANOVA requires a numeric response variable.")
  }
  
  # Check if 'NewClass' has at least two unique values
  if (length(unique(data$NewClass)) < 2) {
    stop("ANOVA requires a variable with at least two unique values.")
  } else {
    message("ANOVA requirements met")
  }
  
 
  anova_result <- aov(H_L_Ratio ~ NewClass, data = data)
  print(summary(anova_result))
  
  return(anova_result)
}



##Run the function 
#ANOVA_HL_Class(alligators_reclassify)

