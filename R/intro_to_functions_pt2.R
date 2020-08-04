## Writing functions, pt2
## M. Espe
## 4 Aug 2020


########################################
## Topics:

## 1. debugging functions
## 2. making functions more robust
## 3. making functions more flexible


cod = read.csv("data/CodParasite.csv")

## Our function:
outlier = function(x,
                   center_value = mean(x, na.rm = TRUE))
{
 #   browser()
    if(is.character(x))
        stop("Please provide numeric or integer inputs")
    stdev = sd(x, na.rm = TRUE)
    which(abs(x - center_value) > 2 * stdev)
}

## Case not tested
outlier(c(1,1,1,1,1,1,100, NA))

outlier(letters)

outlier(c(1,1,1,1,1,1,100, NA), center_value = 5)

## What if we want to add a different way to calculate if something is
## an outlier?

## We might do this...
outlier = function(x,
                   center_value = mean(x, na.rm = TRUE),
                   type = c("stdev", "quantile"))
{
    if(type == "stdev"){
        if(is.character(x))
            stop("Please provide numeric or integer inputs")
        stdev = sd(x, na.rm = TRUE)
        which(abs(x - center_value) > 2 * stdev)
    } else {
        ## quantile method
    }
}

## No good - Not ideal. The outlier() function can get long and
## complicated. It's better to write functions that are small and
## specialized, and then tie them together with another function

outlier_stdev = function(x,
                   center_value = mean(x, na.rm = TRUE))
{
    stdev = sd(x, na.rm = TRUE)
    which(abs(x - center_value) > 2 * stdev)
}

outlier_quantile = function(x)
{
    
}

outlier = function(x, type = c("stdev", "quantile"), ...)
{
    if(is.character(x))
        stop("Please provide numeric or integer inputs")

    if(type == "stdev"){
        outlier_stdev(x, ...)
    } else{
    outlier_quantile(x, ...)
    }
}

## call it like this
outlier(x, type = "stdev", center_value = 10)


########################################
## Exercises:

## 1. Take your function from pt 1., and make it more robust to handle
## NA vallues, and character values.

## 2. Then make it more flexible to allow 1) the user to supply their
## own centering value, 2) the user to supply their own scaling value

## 3. Expand your tests. If you have errors or trouble, use browser()
