#' This function plots H/L ratios by cluster group
#'
#' This function creates a boxplot/jitter plot hybrid.
#' Using the K-means cluster groups that we created we can compare H/L ratios.
#' This function allows us to compare stress over the spatial scale since cluster groups are based on a central coordinate. 
#' 
#'
#'@param data the data set being used, should be .csv
#'@param x_column is the title of your cluster group column (i.e., cluster).
#'@param y_column is the title of your stress variable, this should be continuous data (i.e., H_L_Ratio).
#'@param ylab_text is the title you wish to give you Y axis on the plot. 
#'@param xlab_text is the title you wish to give you X axis on the plot.
#'@return a box and whisker plot with with individual observations (jitter points) overlain on-top.
#'
#'@export 
#'




#library(ggplot2)

plot_box_by_cluster <- function(data, x_column, y_column, ylab_text, xlab_text) {
  
  if (!is.numeric(data[[y_column]])) {
    stop("Error: Heterophil:Lympocyte Ratio data must be numeric.")
  }
  
  if (!is.character(data[[x_column]])) {
    stop("Error: X-axis variable must be a character.")
  } else {
    print("Both x and y-axis requirements were met.")
  }
  
  Plot_argument <- ggplot(data, aes_string(x = x_column, y = y_column)) +
    geom_boxplot(width = 0.5, fill = "white", color = "black", outlier.colour = NA) +
    geom_jitter(aes(color = factor(cluster)), width = 0.2, alpha = 0.7) +
    ylab(ylab_text) +
    xlab(xlab_text) +
    ggtitle(paste(ylab_text, "by", xlab_text)) +
    theme_classic() +
    theme(panel.grid = element_blank()) +
    scale_color_discrete(name = "Cluster")
  
  return(Plot_argument)
}



# Test
#box_cleveland_plot <- plot_box_by_cluster(alligators_reclassify, x_column = "cluster", y_column = "H_L_Ratio",
#    ylab_text = "H/L Ratio", xlab_text = "K-means Cluster Group")

# Print 
#print(box_cleveland_plot)



