#-------------------------------------------------------#
# Final Scripting Project - analysis + visualization
#-------------------------------------------------------#

### In this script, we will:
# Read in the cod dataset and save it to an object
# Examine the structure of the object
# Coerce different columns into different data types.
# write a function to calculate a "condition" ratio
# Add a column to the dataframe using the custom function
# Create a scatterplot of condition, faceted by year

#-------------------------------------------------------#
# Data: types, structures, coercion
#-------------------------------------------------------#

## Read in the cod dataset and save it to an object.  If using read.csv(), add the stringsAsFactors = FALSE argument.



## Examine the str() of the object you created.  Are all the data types of the columns the same?



## Coerce the "Age" column to factors. What are its levels?




## Coerce the Depth column to numeric.




## use the logical indexing and the is.na function to subset cod down to only the rows that don't contain NAs in the Weight and Length columns.  Save the new object (I used "cod2")



# Function writing
#-------------------------------------------------------
# You'll be writing a function that calculates a vector of generic fish "condition" coefficients K, where K = 1e5*W/L^3

##  Where W = Weight of a fish
##  where L = length of a fish


## Plan:



## Write a test for your function.  




## Write your function.




## Use your function to create a new column in the new cod dataframe object



## Summarize the new column: does anything look suspect?




# Plotting
#-------------------------------------------------------#
# Create a scatterplot with condition on the y axis and Depth on the x-axis.  Add a linear (method = "lm") smoothing layer to the plot with geom_smooth.





# Create a boxplot of condition (y) by Year (discrete x axis).




# Create a (to the best of your abilities) "polished" plot of your choice, using the cod dataset.  "Polished" here means a meaningful plot with clean axis and legend titles, custom colors (if applicable), a plot title, and a different built-in theme than the default (try theme_minimal(), theme_classic(), or theme_bw()).  We didn't cover themes in the lectures; look up the documentation for them, and to use one, add its function as a final line, for example:

# ggplot(cod2, aes(x = factor(Age), y = Intensity)) +
#   geom_jitter(alpha = 0.2, width = 0.2) +
#   theme_minimal()


