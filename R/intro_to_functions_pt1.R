## Introduction to writing functions
## M. Espe
## 4 Aug 2020


## Goals:

## 1. Understand what a function is in R
## 2. Anatomy of a function
#     - name
#     - arguments
#     - body
#     - return value
## 3. Write a function
## 4. Document a function
## 5. Test a function


########################################
## Why write functions?

## tedious and error-prone
a = 10 + 1
b = 10 + 2
c = 10 + 2
d = 10 + 4

# Reduces typing and errors
add_to_ten = function(x)
{
    10 + x
}

## R functions only return a single object! They return the results of
## the last expression.  Use c(), list(), data.frame() to combine
## objects into a single overall object.

########################################

cod = read.csv("data/CodParasite.csv")

summary(cod)

## outlier - what is it?
## abs(x - mean) > 2*sd

## 1. Write down what you doing

# We want to find the outliers, give index position
## calc: abs(x - mean(x)) > 2 * sd(x)

## 2. Write a test

outlier(c(rep(1, 10), 100)) ## should result in 11

stopifnot(outlier(c(rep(1, 10), 100)) == 11)

## 3. Write the function

outlier = function(x)
{
    stdev = sd(x)
    mn = mean(x)
    which(abs(x - mn) > 2 * stdev)
}

## 4. Run test


## 5. Expand the tests
stopifnot(outlier(c(rep(1, 10))) == "")
stopifnot(length(outlier(c(rep(1, 10)))) == 0)


##. Document function

outlier = function(x)
    ## Gives index of outliers
    ## x = numeric vector
{
    stdev = sd(x)
    mn = mean(x)
    ## Return index
    which(abs(x - mn) > 2 * stdev)
}

##' Find outliers in a vector.
##'
##' This function returns the index values of which elements are more
##' than 2 standard deviations from the mean.
##' 
##' @title Find Outliers
##' @param x numeric, a vector of values to assess
##' @return integer, index values of which elements qualify as
##'     outliers
##' @author Matt Espe
outlier = function(x)
{
    stdev = sd(x)
    mn = mean(x)
    which(abs(x - mn) > 2 * stdev)
}


########################################
## Exercises:

## 1. Create a function which scales a vector, i.e. takes each number,
##    subtracts the mean, and divides by the standard deviation


########################################
## 2. Create two tests for your function


########################################
## 3. Document each argument for your function
