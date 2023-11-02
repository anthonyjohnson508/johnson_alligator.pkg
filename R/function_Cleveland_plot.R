#' This function creates a Cleveland plot
#'
#' This plot compares the leukocyte:length ratio by animal classification
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


plot_LLRatio_by_class <- function(data, x_axis, y_axis, binwidth) {
  plot_arguments <- ggplot(data, aes_string(x = x_axis, y = y_axis, fill = x_axis)) +
    geom_dotplot(binaxis = "y", stackdir = "center", dotsize = 0.5, position = "jitter", binwidth = binwidth) +
    ylab(y_axis) +
    xlab(x_axis) +
    ggtitle(paste("Leukocyte/Length Ratio by", x_axis))
  
  return(plot_arguments)
}

