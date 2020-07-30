#########################################################
# Plotting in R with ggplot2 - part I
# M. Johnston
# Intro to Programming in R
# Sat Jul 25 22:00:18 2020 ------------------------------

# install.packages("ggplot2")  # un-comment to install if you haven't yet
library(ggplot2)
cod = read.csv("data/CodParasite.csv", stringsAsFactors = FALSE)


# Building a ggplot2 plot: 

## 1) data
ggplot(data = cod)                          # this initializes a plot

## 2) aesthetic mapping
ggplot(data = cod, 
       mapping = aes(x = Depth,             # we've mapped Depth to x-axis
                     y = Intensity))        # and Intensity to the y-axis


## 3) layer(s)
ggplot(data = cod, 
       mapping = aes(x = Depth,        
                     y = Intensity))  +
  geom_point()                              # geom_point() adds the observations


## let's add more layers
ggplot(data = cod, 
       mapping = aes(x = Depth,        
                     y = Intensity))  +
  geom_point()  +                           # geom_point() adds the observations
  geom_line() +
  geom_area()


## let's map some more variables to aesthetics
ggplot(data = cod, 
       mapping = aes(x = Depth,        
                     y = Intensity))  +
  geom_point(aes(color = factor(Year) , 
                 size = Age),
             alpha = 0.2
             )  +
  scale_color_manual(values = c("steelblue", "coral", "purple")) +
  guides(color = "none",              # removes the color legend for Year 
         size = guide_legend(title = "Age in Years")) 

#-------------------------------------------------------#
# On Your Own
#-------------------------------------------------------#
# Make a scatterplot (geom_point) plot of the cod data, using whatever two variables you choose.  Try mapping the Depth variable to color, and then to Prevalence.  What do you notice?


#########################################################
# The three main components of a ggplot2 plot can be placed in different locations in the code.  This is very confusing at first.  Which one are you supposed to do?

# Data and mapping in ggplot(); + layer() (via a geometry)
#-------------------------------------------------------#
ggplot(data = cod,                               # 1. data
       mapping = aes(x = Depth,                  # 2. mapping
                     y = Intensity)) +    
  geom_point() +
  geom_line()                                    # 3. layer


# data in ggplot(); + mapping in the geom layer()
#-------------------------------------------------------#
ggplot(data = cod) +                             # 1. data
  geom_point(mapping = aes(x = Depth,            # 2 & 3. mapping, layer
                           y = Intensity)) +
  geom_line()


# ggplot() initializes; + data and mapping both in the geom layer()
#-------------------------------------------------------#
ggplot() +
  geom_point(data = cod,                         # 1, 2, & 3
             mapping = aes(x = Depth,            # are all set
                           y = Intensity)) +     # in the first layer
  geom_line(data = cod, aes(x = Depth, 
                            y = Intensity))




ggplot(data = cod, aes(color = Age)) +
  geom_point(mapping = aes(x = Depth,          
                           y = Intensity,
                           color = Prevalence))  # note that when we try to map
                                                 # color in this point layer,
                                                 # it doesn't work; color is
                                                 # already mapped to Age in the
                                                 # ggplot() call in the first line.

# On Your Own: make a new ggplot scatterplot using the cod data; map the Weight variable to the x-axis, and the Length variable to the y axis.  Create the same plot three times with different arrangements of components, as we did in the code above.



#########################################################

