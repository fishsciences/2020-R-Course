#-------------------------------------------------------#
# Logicals & Lists
# M. Johnston
# Introduction to Programming in R
# Mon Jul 20 21:42:53 2020 ------------------------------


# BEFORE WE START: '=' AND '<-' mean the SAME THING 
# assignment operators: =, <-, ->
  x = 5
  x <- 5   

#-------------------------------------------------------#
# PART 1: LISTS AND DATA FRAMES
#-------------------------------------------------------#
#  Let's make a list of some of my favorite things
my_faves = list(sea_mammals = c("otters", "blue whales", "gray whales"),
               numbers = 20,
               dive_spots = c("Catalina", "Tasmania"),
               r_datasets = list(rivers, Nile))

#  syntax to make a list with m components: Lst <- list(name_1 = object_1, …, name_m = object_m)

my_faves
str(my_faves)


#  Let's make a data frame:
as.data.frame(my_faves)                   # on your own: why doesn't this coercion work?

cod = read.csv("data/CodParasite.csv")    # cod parasite dataset; in the data/ directory of the R course repo
str(cod)

#-------------------------------------------------------#


#-------------------------------------------------------#
# PART 2: INTRO TO LOGICAL OPERATORS
  
  ## Building up: operations on short vectors -> indexing long vectors -> indexing data frames
#-------------------------------------------------------#
# logical operators: ==, <, >, <=, >=, !, &, %in%
  
    x == 5              # "==" means 'is it equal to'
    x < 6
    x > 6

# logical operators are "vectorized", and vectorized operations are fast:  
y = c(3,5,7,9) 
    y <= 5
    y != 5              # '!' means 'is not'
    y != 5 & y > 7
    y != 5 | y > 7
    y %in% c(5,6,7,8)   # asks: element by element, "is y found within c(5,6,7,8)?"


# often want to subset the original thing with logicals:
y[y != 5]

  
## Using logical operators and brackets to subset 
##  a more complex vector
#-------------------------------------------------------#
rivers                      # type ?rivers in the console to find out more about this data
x = rivers > 200            # asks: for each element of rivers, is it true that it is greater than 200?
sum(x)                      # TRUEs = 1.0, FALSEs = 0.0


# Getting back the thing you wanted: have to "index" it by bracketing the logical statement
y = rivers[rivers > 200]
y2 = rivers[x]

identical(y, y2)


length(y2)                
length(rivers)            # indexing rivers by the logical vector "dropped" the value of the original vector that corresponded to FALSE


# Using logicals to index/subset entire data frames, not just vectors
#-------------------------------------------------------#
Sel <- cod$Year == 1999       # creates a logical vector corresponding to the rows where Year == 1999
cod2 = cod[Sel, ]             # subsets the cod data frame according to the condition that Year == 1999

cod2 = cod[cod$Year == 1999, ]  # Does the two steps above in a single step
table(cod2$Year)

# On Your Own: how would you subset `cod` to the years of 
# data greater than 1999?
#-------------------------------------------------------#






# subset all cod not of Age 0
table(cod$Age)
cod2 = cod[cod$Age != 0, ]

# On Your Own: What is another way of doing the same thing 
# on line 99?
#-------------------------------------------------------#


# subset only infected cod:
unique(cod$Prevalence)
cod.inf = cod2[cod2$Prevalence == 1, ]

# subsetting to only the observations where the intensity 
#is equal to or greater than the median:
cod3 = cod[cod$Intensity >= median(cod$Intensity) , ] 

# using logicals to ask questions about our data:
#-------------------------------------------------------#
length(unique(cod$Sample)) == nrow(cod)  # asks: does each row 
                                         # of the cod data frame
                                         # represent a unique Sample ID?


# On your own:  how would you find out if there are an equal 
# number of rows associated with each year?
# Hint: there are a lot of different ways to do this.  
# Try using logical operations to make different subsets,
# and then use nrow() to compare them.
