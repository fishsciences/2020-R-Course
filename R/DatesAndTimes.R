#-------------------------------------------------------#
# it's X o'clock - do you know what time it is where your students are?
# M. Johnston & M. Espe
# Thu Jul 16 15:34:24 2020 ------------------------------

source("R/utils.R")
library(lubridate)  # if don't already have this package, 
                    # run install.packages("lubridate") in your R console.

# vector of time zones - these are the names you'd want to copy to use for your own time zone as the my_tz argument in the office_hrs function below.
tzs = c("America/Los_Angeles", 
        "UTC",
        "America/Mexico_City",     # La Paz
        "America/New_York",        # Cleveland
        "Europe/London",           # London & Bristol
        "Australia/Hobart")        

#-------------------------------------------------------#
# Office Hours
# A function to determine what time office hours are in your time zone

office_hrs = function(week = 3, my_tz = "America/Denver") {
  
        weeks = seq.Date(from = as.Date("2020-07-09"), length.out = 6, 
                   by = "week")
  
        times = lubridate::ymd_hms(paste(weeks[week], 
                          c("15:00:00", "22:00:00"), sep = " "))
  
        lubridate::with_tz(times, my_tz)
    
  }


# Example: what is the date and time of office hours in Australia next week?
office_hrs(week = 3, my_tz = "Australia/Hobart")


#-------------------------------------------------------#



#-------------------------------------------------------#
# Big dataframe 'o times
#-------------------------------------------------------#
ct = as.POSIXct("2020-07-17 07:00:00", tz = "America/Los_Angeles")
reas_times = ct + hours(0:9)  #7am-4pm PDT


# function to tell me what time that corresponds to in other time zones:
wtii = function(my_times, time_zones) {
  
    ans = lapply(time_zones, function(tz) {
        with_tz(my_times, tz)
    })
    names(ans) = time_zones
    data.frame(my_times = my_times, ans)
}


wtii(reas_times, tzs)
