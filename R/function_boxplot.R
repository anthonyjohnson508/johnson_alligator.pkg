



box_by_class <- function(data, x_axis, y_axis, ylab, xlab, title) {
  plot_arguments <- ggplot(data, aes(x = {{x_axis}}, y = {{y_axis}})) +
    geom_boxplot() +
    ylab(ylab) +
    xlab(xlab) +
    ggtitle(title)
  
  return(plot_arguments)
}




#boxplot <- box_by_class(alligators, "NewClass", "H_L_Ratio", 
                       # ylab = "HL Ratio", 
                      #  xlab = "Size", 
                      #  title = "HL Ratio by size")

#print(boxplot)



#you may need a groupby
