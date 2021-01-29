require(dplyr)
require(lubridate)
require(magrittr)
setwd("C:/Users/bexar_000/Desktop/School/WorkFromHome/Coursera/Data Science/Course 4")

elec <- read_delim('household_power_consumption.txt',
                   delim=';')
elec %<>%
  mutate(Date = dmy(Date)) %>% 
  filter(Date >= ymd('2007-02-01')&
           Date <= ymd('2007-02-02'))


png('plot1.png')
hist(elec$Global_active_power,
     breaks=14,
     col='red',
     xlab='Global Active Power (kilowatts)')
dev.off()
