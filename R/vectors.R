# Data types and vectors
# M. Johnston
# Thu Jul 16 12:19:28 2020 ------------------------------

# functions in this script: c(), typeof(), class(), as.*, length(), `[`,  data.frame()

#-------------------------------------------------------#
# creating vectors of different atomic types
#-------------------------------------------------------#
v1 = 1                    #   this creates a numeric/double vector called "v1"

typeof(v1)
class(v1)
length(v1)

v2 = c(1, 2, 3, 4)        # whole numbers will be stored as numeric
                          # or doubles by default


v2.5 = c(1L, 2L, 3L, 4L)  # if you want integers, use "L" after 
                          # the number,

v2.5 = as.integer(v2)     # or you can use the as.* set of 
                          # functions to convert it


v3 = c("apple", "mango", "kiwi")  # character vector
length(v3)

# On your own: how would you convert v2.5 into a character vector?
#

v4 = c(TRUE, TRUE, FALSE) # logical vector


#-------------------------------------------------------#
# coercion of data types
#-------------------------------------------------------#
# what happens if you try to combine the vectors into one vector?

v4 = c(v1, v2, v3)
typeof(v4)
length(v4)

as.numeric(v4)    # if you try to force a character 
                  # vector to numeric, you will get NAs 
                  # for all the ones it has trouble with

v5 = c(1.0, TRUE, "TRUE")
typeof(v5)

v6 = c(1L, TRUE)
typeof(v6)

# On your own: create a vector with elements "ocean", 6.7, 5L, FALSE, and NA.  (name it whatever you like).  What is the type of the resulting vector?  What is its length?


#-------------------------------------------------------#
# indexing/extraction/subsetting/querying vectors
#-------------------------------------------------------#

length(v3)
v3[1]         # `[` is a function.  You can look it up with ?`[`
v3[3]         # this pulls the 3rd element of the vector v3
v3[]          # this is the same as asking it for everything
v3[1:3]       # this asks for elements 1 through 3
v3[-2]        # this asks for everything EXCEPT the 2nd element
v3[-c(1,3)]   # here we are subsetting the vector by another vector 

#-------------------------------------------------------#
# adding/editing vectors
#-------------------------------------------------------#
v3[5]           # currently, there is no 5th element; the length is 3
v3[5] = "limes" # you can assign additional elements; if you accidentally skipped one (here we skipped 4), R will insert NAs in between

v3 = c(v3, "bananas", "lemons", "plums")  # adding more than one element
                                          # is easier with the c()
                                          # function

v3
length(v3)


# building vectors into more complex data structures
#-------------------------------------------------------#
a = c(1.0, 3.45, 5e6)
b = v3[1:3]
cc = as.integer(a)

df1 = data.frame(a, b, cc)
str(df1)
typeof(df1)
class(df1)
