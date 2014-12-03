#Import and clean data

hhpower = read.table("household_power_consumption.txt", header=TRUE, sep=";")
head(hhpower)
hhpower$date2 = as.Date(hhpower$Date, "%d/%m/%Y")
head(hhpower, 30)
hh <- subset(hhpower, date2 == "2007-02-01" | date2 == "2007-02-02")
head(hh)
rm(hhpower)

#load lubridate and parse date and time to POSIx
library(lubridate)
hh$DateTime = paste(hh$date2,hh$Time, sep = " ")
hh$dt1 = ymd_hms(hh$DateTime)
plot(hh$dt1, (as.numeric(hh$Global_active_power)/500), type="l", ylab="Global Active Power (kilowatts)", xlab="")