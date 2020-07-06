source("R/utils.R")

# it's X o'clock - do you know what time it is where your students are?

library(lubridate)

# POSIXct
ct = as.POSIXct("2020-07-17 07:00:00", tz = "America/Los_Angeles")
reas_times = ct + hours(0:9)  #7am-4pm PDT
tzs = c("America/Los_Angeles", # should be the same
               "America/Mexico_City", # La Paz
               "America/New_York", # Cleveland
               "Europe/London", # London & Bristol
               "Australia/Hobart") # Hobart

# function to tell me what time that corresponds to in other time zones:
wtii = function(my_times, time_zones) {
  
  df = data.frame(my_time = my_times)
  for(i in 1:length(time_zones)) {
  df[[time_zones[i]]] = with_tz(df$my_time, time_zones[i])}
  return(df)
  
}


wtii(reas_times, tzs)
