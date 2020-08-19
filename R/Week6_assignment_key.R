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

cod = read.csv("data/CodParasite.csv", stringsAsFactors = FALSE)

## Examine the str() of the object you created.  Are all the data types of the columns the same?

str(cod)

## Coerce the "Age" column to factors. What are its levels?

cod$Age = as.factor(cod$Age)
levels(cod$Age)

## Coerce the Depth column to numeric.

cod$Depth = as.numeric(cod$Depth)
str(cod$Depth)

## use the logical indexing and the is.na function to subset cod down to only the rows that don't contain NAs in the Weight and Length columns.  Save the new object (I used "cod2")

cod2 = cod[!is.na(cod$Weight) & !is.na(cod$Length), ]

# Function writing
#-------------------------------------------------------#plan for a function that calculates a vector of generic fish "condition" coefficients K, where K_i (the K for an individual fish i) = 1e5*W_i/L_i^3

##  Where W_i = Weight of a fish i
##  where L_i = length of a fish i


## Plan:
# output: a numeric vector of condition factors, one for each fish.
# inputs: vectors of weights and lengths

## Write a test for your function.  
stopifnot(sum(is.na(cod2$Weight)) == 0)
stopifnot(sum(is.na(cod2$Length)) == 0)
lengths = c(1, 5, 0)
stopifnot(lengths != 0)


## Write your function.

condition = function(weights, lenghts) {
  num = 1e5*weights
  den = lengths^3
  K = num/den
  return(K)
}

## Use your function to create a new column in the new cod dataframe object

cod2$K = condition(cod2$Weight, cod2$Length)

## Summarize the new column: does anything look suspect?

summary(cod2$K)


# Plotting
#-------------------------------------------------------#
# Create a scatterplot with condition on the y axis and Depth on the x-axis.  Add a linear (method = "lm") smoothing layer to the plot with geom_smooth.

ggplot(cod2, aes(x = Depth, y = K)) +
  geom_point() +
  geom_smooth(method = "lm")


# Create a boxplot of condition (y) by Year (discrete x axis).

ggplot(cod2, aes(x = factor(Year), y = K)) +
  geom_boxplot()


# Create a (to the best of your abilities) "polished" plot of your choice, using the cod dataset.  "Polished" here means a meaningful plot with clean axis and legend titles, custom colors (if applicable), a plot title, and a different built-in theme than the default (try theme_minimal(), theme_classic(), or theme_bw()).  We didn't cover themes in the lectures; look up the documentation for them, and to use one, add its function as a final line, for example:

ggplot(cod2, aes(x = factor(Age), y = Intensity)) +
  geom_jitter(alpha = 0.2, width = 0.2) +
  theme_minimal()


