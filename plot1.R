#Import and clean data

hhpower = read.table("household_power_consumption.txt", header=TRUE, sep=";")
head(hhpower)
hhpower$date2 = as.Date(hhpower$Date, "%d/%m/%Y")
head(hhpower, 30)
hh <- subset(hhpower, date2 == "2007-02-01" | date2 == "2007-02-02")
head(hh)
rm(hhpower)

#use png to export
png(filename="plot1.png", width=480, height=480)

#construct plot
hist(as.numeric(hh$Global_active_power)/500, xlab="Global Active Power (kilowatts)", main="Global Active Power", col="red")

#close graphics device
dev.off()