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


png('plot2.png')
plot(elec$Global_active_power,
     type='l',
     ylab='Global Active Power (kilowatts)',
     xlab='',
     xaxt='n')
axis(1, at=c(1, 1440, 2880), labels = c('Thu','Fri','Sat'))
dev.off()
