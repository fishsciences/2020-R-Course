# Demo Exploratory Data Analysis
# M. Johnston
# Tue Jul 14 10:23:47 2020 ------------------------------

library("ggplot2")
library(leaflet)
d = read.csv("data/sea_mammals.csv")

# inspect data
#-------------------------------------------------------#
head(d)
str(d)
# View(d)
table(d$SPECIES)
table(d$FLIGHTNUMBER)

# data cleaning
#-------------------------------------------------------#
d = d[ , -1]
lwrcase = tolower(colnames(d))
colnames(d) = lwrcase

# fix date format
d$date = as.Date(strptime(d$date, format = "%d-%b-%y"))

# plot data
#-------------------------------------------------------#

# group size ~ species
ggplot(d, aes(x= species, y = groupsize)) +
  geom_jitter(aes(color = species),
              size = 2.5,
              alpha = 0.5,
              show.legend = FALSE,
              width = 0.15)

# plot lat/lon
ggplot(d, aes(x = longitude, y = latitude)) +
  geom_point()


# make map of points
#-------------------------------------------------------#
leaflet(d) %>% 
  addTiles() %>% 
  addCircleMarkers(radius = 1)
