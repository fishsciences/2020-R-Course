## Working with data.frames in R
## M. Espe
## 2020 July 23


## Goals: Learn...

## 1. multiple ways to subset a data.frame
## 2. using indices for reducing and increasing a data.frame
## 3. creating columns
## 4. how to reorder and subset a data.frame
## 5. save a data.frame to a CSV


################################################################################
## 1. multiple ways to subset a data.frame

x = data.frame(a = 1:5,
               b = month.name[1:5],
               row.names = letters[1:5])

x$a
x$b
x[1 , ]  
x["a" , ]
x[c("a", "b"),]
x[ , "a"]
x[ , c("a", "b")]

x[["a"]] 

x
################################################################################
## 2. using indices for reducing and increasing a data.frame
x[c(1,2,3,4,5,1),]
x[, c("a", "b", "a")]

i = sample(1:5, 20, replace = TRUE)
x[i , ]


x[0 , ]
x[ -1, ]
x[ , -2]

################################################################################
## 3. creating columns

x$c = rnorm(5)
x$d = LETTERS[1:5]
x[, "d"] = LETTERS[1:5]

x = cbind(x, e = 6:10)

################################################################################
## 4. how to reorder and subset a data.frame
cod = read.csv("data/CodParasite.csv")

y = rnorm(10)
sort(y, decreasing=TRUE)
sort(cod$Weight)

i = order(cod$Weight)
cod[i, "Weight"]
cod[i,]

cod2 = cod[i,]

j = is.na(cod$Intensity)

cod_nas = cod[j, ] 

cod_nonna = cod[ !j, ] 

################################################################################
## 5. save a data.frame to a CSV

write.csv(cod_nas, file = "cod_na_values.csv")
write.csv(cod_nonna, file = "cod_complete_values.csv")

