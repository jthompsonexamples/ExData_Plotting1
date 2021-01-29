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


png('plot3.png')
plot(elec$Sub_metering_1,
     type='l',
     ylab='Energy sub metering',
     xlab='',
     xaxt='n')
lines(elec$Sub_metering_2, col='red')
lines(elec$Sub_metering_3, col='blue')
axis(1, at=c(1, 1440, 2880), labels = c('Thu','Fri','Sat'))
legend('topright', legend = names(elec)[7:9],
       col=c('black','red','blue'), lwd=1)
dev.off()
