#########################################################
# Plotting in R with ggplot2 - part II
# M. Johnston
# Intro to Programming in R
# Tues Jul 27 21:27:38 2020 ------------------------------

library(ggplot2)
cod = read.csv("data/CodParasite.csv", stringsAsFactors = FALSE)

# Components of a ggplot: default dataset and mappings from variables to aesthetics,
# **one or more layers**, one scale for each aesthetic mapping, 
# a coordinate system, and a facetting specification.

### ---- Components of a layer: a geom, a stat, a position adjustment

#-------------------------------------------------------#
# Build some plots with all components
#-------------------------------------------------------#

## Boxplot
#-------------------------------------------------------#
ggplot(data = cod, aes(x = factor(Year), y = Weight)) +   # x = discrete scale, 
                                                          # y = continuous scale
  
  geom_jitter(aes(color = Depth), width = 0.1) +          # color = continuous scale
  
  geom_boxplot(alpha = 0.75, outlier.shape = NA)          # stat = "boxplot"


## Scatterplot, facetted by year
#-------------------------------------------------------#
ggplot(cod, aes(Length, Weight)) +                        # x&y = continuous scales
  
  geom_point() +                                          # stat = "identity"
  
  facet_wrap(~Year)                                       # facetting specification



#### On your own: try facetting by Prevalance.  Look up ?facet_wrap() and try to adjust the y-axes to be "free"


## barplot, with discrete fill (color) scale
#-------------------------------------------------------#
ggplot(cod, aes(x = factor(Year))) +                     # no y mapping, because barplot
  
  geom_bar(aes(fill = factor(Year)),                     # stat = "count"; automatic with
                      show.legend = FALSE)  +            # barplots 

  scale_fill_brewer(palette = "Set2")


## barplot, with stat = "identity" and position = "stack"
#-------------------------------------------------------#
ggplot(cod, aes(x = factor(Year), y = Depth)) +
  
  geom_bar(aes(fill = factor(Stage)), stat = "identity") +  # what happens when you delete
                                                            # the stat specification?
  scale_fill_brewer(palette = "Set2", type = "div") 


## same barplot, with position = "dodge"
#-------------------------------------------------------#
ggplot(cod, aes(x = factor(Year), y = Depth)) +
  
  geom_bar(aes(fill = factor(Stage)), stat = "identity", position = "dodge") +
  
  scale_fill_brewer(palette = "Set2", type = "div")  


#### On your own: look up ?geom_histogram.  Try to make a histogram plot with Depth on the x-axis.  Adjust the binwidth; try very low values, and very high values.  Try setting the color fill to factor(Prevalence), the position adjustment to dodge, and finally try adding a manual fill scale with scale_fill_manual().


## Scatter plot with date on the x axis:
#-------------------------------------------------------#
d = faithful                                             # built-in dataset
d$date = seq.Date(from = as.Date("2020-01-01"),          # create column of dates
                  length.out = length(d$eruptions),
                  by = "day")

p = ggplot(d, aes(x = date, y = waiting)) +             # create plot and assign it
  geom_point()                                          # to an object "p"


p                                                       # this is what default date
                                                        # scale looks like


p + 
  scale_x_date(breaks = "2 months")                     # adjust the intervals

p +
  scale_x_date(breaks = "2 months", date_labels = "%b")  # get back month abbreviations
