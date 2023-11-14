#' This function is used to run an ANOVA.
#'
#'The ANOVA compares the reclassified alligators size classes to their HL ratios.
#'
#'@param data the data set being used, should be .csv
#'@return ANOVA results in a summary table including total and residual Degrees of freedom, Sum of Squares, Mean Squares, F-statistic, and P-value.
#'
#'@export 
#'



ANOVA_HL_Class <- function(data) {
  anova_result <- aov(H_L_Ratio ~ NewClass, data = data)
  print(summary(anova_result))
  return(anova_result)
}


##Run the function 
#ANOVA_HL_Class(alligators_reclassify)

# there needs to be some way to figure out if this worked, generate some type of error output. It could be if else or some other way