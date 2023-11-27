#' This function uses K-means cluster to create cluster groups based on geographic location.
#'
#' This function adds four new columns to your original data set.
#" Four new columns = cluster which the animal belongs to (cluster), the number of animals in the group (Gators_Per_Cluster), the cluster groups latitude at the center (center_lat), and the cluster groups longitude at the center (center_long).
#' These new columns can be utilized to conducted additional spatial analysis.
#'
#'@param data the data set being used, should be .csv, and should have separate columns with latitude and longitude data.
#'@param lat_column The column name of your latitude data.
#'@param long_column The column name of your longitude data.
#'@param K is the number of groups you wish to generate, i.e., K=10 generates ten cluster groups to house observations in.
#'@return a mutated data set with a four new columns: cluster group, animals per cluster, latitude center, and longitude center.
#'
#'@export 
#'


#library(dplyr)

cluster_data <- function(data, lat_column, long_column, k) {
  
  if (any(grepl("-", data[[lat_column]]))) {
    warning("You may have mixed your lat and long columns. '-' symbols found in the latitude column.")
  }
  
  coordinates <- data[c(lat_column, long_column)]
  kmeans_result <- kmeans(coordinates, centers = k)
  data$cluster <- as.character(kmeans_result$cluster)
  cluster_counts <- data %>%
    group_by(cluster) %>%
    summarise(Gators_Per_Group = n_distinct(Unique_ID))
  cluster_centers <- data %>%
    group_by(cluster) %>%
    summarise(center_lat = mean(.data[[lat_column]]),
              center_long = mean(.data[[long_column]]), .groups = 'drop')
  result <- left_join(data, cluster_counts, by = "cluster") %>%
    left_join(., cluster_centers, by = "cluster")
  
  return(result)
}


##test and print
#alligators_reclassify <- cluster_data(alligators_reclassify, lat_column = "Lat", long_column = "Long", k = 10) #works
#Checkifstatement<- cluster_data(alligators_reclassify, lat_column = "Long", long_column = "Lat", k = 10) #busted, purposefully switched lat and long
#print(alligators_reclassify)
