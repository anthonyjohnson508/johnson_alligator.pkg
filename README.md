# johnson_alligator.pkg

## An R package for processing fake alligator data



## Introduction
This R package was designed to meet the requirements for the GBIO 508 course at Southeastern Louisiana University. It is a useful package if you have a fake alligator data set that you would like to manipulate and analyze. Although you are unlikely to have a comparable fake alligator data set, this package may be of use to you if you would like to practice mutating new columns, running simple analyses, plotting data, and clustering geographic data using machine learning. If you do not have your own fake alligator data set, you're in luck! I have provided one that you are welcome to use, but please remember while this fake data set is intended to be comparable to my own real thesis data, I totally made this stuff up!


## Overview
This package contains six distinct functions. A function that cleans the data (reclassify), another that manipulates data (calc_LL_ratio), one that performs statistical analysis (aov_HLclass), one to plot data (Cleveland_plot), one for fun that I made to challenge myself (Geo_Kluster), and one that is applicable to my research (clusterbox). Each function builds off one another and generates new columns that are added to the original data set. For a more in-depth overview of each function see below:


### Data Cleaning (reclassify)
I wrote a function called reclassify that essentially cleans the data. I did this for two reasons, one because I made up this data set and I did not have any NA values to remove. And two, after I created this data set I realized that alligator biologists typically classify crocodilians into four size classes (hatching, juvenile, sub adult, and adult) instead of three (hatching, juvenile, adult) as I had done. Because I was practicing for a future analysis that I will do for my thesis, I decided that it is a good idea to update the classification to meet current practices. This function houses the new classification data in a column titled "NewClass". 

Validation: This function has a simple validation build in checking that the added "Subadult" was identified in the new column. If "Subadult" is identified in the new column the user will get the message, "Reclassification is correct!" if not the user will get the following message, "Reclassification may contain errors."



### Data Transformation (calc_LL_ratio)
The function calc_LL_ratio was written as a way to transform data. This function works by simply dividing column_a (H:L ratio data) by column_b (total length data) and returns a column titled L_L_Ratio. This is not very useful to alligator biologists and is not ecologically significant but it allowed me a way to practice running some type of mathematical equation to manipulate the data set. 

Validation: This function is checked for possible errors of non-numeric or infinite values. If either is identified the user will receive this warning, "Mathematical calculation may contain non-finite values. Please verify.", however if no non-numeric or infinite values are detected the user receives the message, "No non-numeric or infinite values detected."



### Satistical Analysis (aov_HLclass)
The function aov_HLclass builds off of the reclassify function and is intended to be used for performing statistical analysis via a simple ANOVA. This function analyzes the relationship between "NewClass" (created using the reclassify function) and H_L_Ratio. This function results in a ANOVA summary table comparing the relationship between the class and H:L ratio.

Validation: This function checks that "NewClass" data has at least two categories to compare against each other. If this is met the user receives the message, "ANOVA requirements met" if not then the following stop message is returned, "ANOVA requires a variable with at least two unique values."



### Data Visualization (Cleveland_plot)
The Cleveland_plot function builds off both the reclassify and calc_LL_ratio functions. Its intended use is for creating a visual comparison of the relationship between L:L ratio and size class. For this function to work properly the user must appropriately assign the correct columns to the x and y axis. For this function to work properly the x_axis should equal "NewClass" and the y_axis should equal "L_L_Ratio". This function also requires that a binwidth be set. A recommended starting binwidth is "0.0050". 

Validation: A validation is in place to ensure that the input data for both the x and y axis are correctly met. For this function to work the y axis must be numeric and the x axis must be character data. If these requirements are met the following message will be provided, "Both x and y-axis requirements were met." If not, one of the following messages will be provided, "Error: Leukocyte/Length Ratio data must be numeric." or "Error: X-axis variable must be a character."



### A Fun Clustering Tool (Geo_Kluster)
The main purpose of the Geo_Kluster function is to create functional groups based off of geographic location so that future statistical analysis can be done to understand the effects of space. This function uses machine learning to group individuals based on similarity with one another. Since this function only takes into account latitude and longitude it is simply grouping individuals with each other based off of proximity. The user of the Geo_Kluster function is required to define how many cluster groups to create (k = "number of groups wanted"). Geo_Kluster returns four new columns (cluster, Gators_Per_Group, center_lat, and center_long). The column cluster houses the unique identifying cluster number that the individual is housed in. Gators_Per_Group informs the user of how many alligators are in the unique group (this may be useful for trying to obtain an semi-even distribution). And center_lat and center_long find the geographic centers for each cluster group as this may be useful for future mapping. 


Validation: When working with spatial data, users sometimes mix Latitude with Longitude producing geographic points somewhere else in the world. This function has a simple validation that checks for a negative symbol in the latitude column (note: this validation check would only work north of the equator and west of the Prime Meridian). If a negative value is found in the latitude column the following warning will be provided, "You may have mixed your lat and long columns. '-' symbols found in the latitude column."



### Another Plotting Function (clusterbox)
Something that is applicable to my research is understanding the relationship between space use and stress (using H:L ratio as a proxy for stress). Therefore I decided to make another plotting function called clusterbox that creates a visual comparison of spatial groups ("cluster", created with Geo_Kluster) and H_L_Ratio. This function returns a box plot with jitter points overlain on top comparing the defined number of clusters by their stress levels (H:L ratio). The user is expected to define the appropriate columns in order to appropriately set the axis (x_column = "cluster", y_column = "H_L_Ratio"). 

Validation: Similar to the Cleveland_plot function a validation ensures that the inputs for box axis are correctly met. For this function to work the y axis must be numeric and the x axis must be character data. If these requirements are met the following message will be provided, "Both x and y-axis requirements were met.". If not, one of the following messages will be provided, "Error: Heterophil:Lympocyte Ratio data must be numeric." or "Error: X-axis variable must be a character."
