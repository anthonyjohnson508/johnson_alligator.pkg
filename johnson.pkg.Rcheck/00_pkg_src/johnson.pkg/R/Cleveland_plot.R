#' This function creates a Cleveland plot.
#'
#' This plot compares the leukocyte:length ratio by animal classification.
#" 
#'
#'@param data the data set being used, should be .csv.
#'@param x_axis this is the column data that will be used for the x axis, this should be your classification data.
#'@param y_axis this is the column data that will be used for the y axis, this should be your continuous leukocyte:length ratio data.
#'@param binwidth sets the binwidth/dot size. This should be a numeric value. Suggested range is from 0.0020 - 0.0030 but your preference may be outside this range.
#'@return A Cleveland plot by classification of leukocyte:length ratio data.
#'
#'@export 
#'



Cleveland_plot <- function(data, x_axis, y_axis, binwidth) {
  
  if (!is.numeric(data[[y_axis]])) {
    stop("Error: Leukocyte/Length Ratio data must be numeric.")
  }
  
  if (!is.character(data[[x_axis]])) {
    stop("Error: X-axis variable must be a character.")
  } else {
    print("Both x and y-axis requirements were met.")
  }
  
  custom_order <- c("Adult", "Subadult", "Juvenile", "Hatchling")
  data[[x_axis]] <- factor(data[[x_axis]], levels = custom_order)
  
  plot_arguments <- ggplot(data, aes_string(x = x_axis, y = y_axis, fill = x_axis)) +
    geom_dotplot(binaxis = "y", stackdir = "center", dotsize = 0.5, position = "jitter", binwidth = binwidth) +
    ylab(y_axis) +
    xlab(x_axis) +
    ggtitle(paste("Leukocyte/Length Ratio by", x_axis))
  
  return(plot_arguments)
}


##run and print
#plot <- Cleveland_plot(alligators_reclassify, "NewClass", "L_L_Ratio", 0.0050)
#print(plot)


