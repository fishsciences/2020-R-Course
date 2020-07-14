# Demo Exploratory Data Analysis script
# M. Johnston
# Mon Jul 13 21:39:28 2020 ------------------------------

d = read.csv("data/sea_mammals.csv")

# Ways to view/get more information about your data
head(d)
str(d)
table(d$SPECIES)


# I don't love that some columns are in all caps, and some aren't
lwr = tolower(colnames(d))
colnames(d) <- lwr

# fix the dates
str(d$date) # not ideal
d$date = as.Date(strptime(d$date, format = "%d-%b-%y")) 
str(d$date) # preferred ISO date format, YYYY-MM-DD

# plot data
library(ggplot2)

# Group size ~ Species
ggplot(d, aes(x = SPECIES, y = GROUPSIZE)) +
  geom_jitter(aes(color = SPECIES), 
              alpha = 0.5, 
              show.legend = FALSE,
              width = 0.15)

# lat/lon - not much help without a basemap
ggplot(d, aes(x = LONGITUDE, y = LATITUDE)) +
  geom_point()


# very rough/quick map of points with basemap
library(leaflet)

leaflet(d) %>%
  addTiles() %>% 
  addCircleMarkers(radius = 1)
