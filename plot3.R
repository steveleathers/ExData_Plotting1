#Import and clean data

hhpower = read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE)
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

#use png to export
png(filename="plot3.png", width=480, height=480)

#construct plot
plot(hh$dt1, hh$Sub_metering_1, type="l", ylab="Energy sub metering", xlab="")
lines(hh$dt1, as.numeric(hh$Sub_metering_2), type="l", col="red")
lines(hh$dt1, hh$Sub_metering_3, type="l", col="blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1,1, 1), lwd=c(2.5, 2.5, 2.5),col=c("black", "red", "blue"))
#close graphics device
dev.off()