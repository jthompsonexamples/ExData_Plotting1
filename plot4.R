require(dplyr)
require(lubridate)
require(magrittr)
setwd("C:/Users/bexar_000/Desktop/School/WorkFromHome/Coursera/Data Science/Course 4")

elec <- read_delim('household_power_consumption.txt',
                   delim=';')
# filter the data, only keeping the two dates of interest
elec %<>%
  mutate(Date = dmy(Date)) %>% 
  filter(Date >= ymd('2007-02-01')&
           Date <= ymd('2007-02-02'))


png('plot4.png')
par(mfrow=c(2,2))
# plot 1
plot(elec$Global_active_power,
     type='l',
     ylab='Global Active Power',
     xlab='',
     xaxt='n')
axis(1, at=c(1, 1440, 2880), labels = c('Thu','Fri','Sat'))
# plot 2
plot(elec$Voltage,
     type='l',
     ylab='Voltage',
     xlab='datetime',
     xaxt='n')
axis(1, at=c(1, 1440, 2880), labels = c('Thu','Fri','Sat'))
# plot 3
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
# plot 4
plot(elec$Global_reactive_power,
     type='l',
     ylab='Global_reactive_power',
     xlab='datetime',
     xaxt='n')
axis(1, at=c(1, 1440, 2880), labels = c('Thu','Fri','Sat'))
dev.off()
