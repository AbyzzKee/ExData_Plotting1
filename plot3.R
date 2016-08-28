# This R file plot lines of "Sub_metering_1", 2 and 3
# from dataset "household_power_consumption.txt"

plot3 <- function(){
	# Read in data, convert date as.Date
	setClass("myDate")
	setAs("character","myDate", function(from) as.Date(from, format="%d/%m/%Y") )
	powerRaw = read.table("household_power_consumption.txt", header=TRUE, sep = ";", quote="", na.strings = "?", colClasses = c('myDate', 'character', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric'))

	# Get data within startDate and endDate
	startDate <- as.Date("2007-02-01", format="%Y-%m-%d")
	endDate   <- as.Date("2007-02-02", format="%Y-%m-%d")
	targetRows = powerRaw[powerRaw$Date >= startDate & powerRaw$Date <= endDate,]

	# Get dateTime by combining Date and Time
	dateTimeData = as.POSIXct(paste(targetRows$Date, targetRows$Time), format="%Y-%m-%d %H:%M:%S");

	# Start plotting in png
	png( file = "plot3.png", width=480, height=480 )
	plot( dateTimeData, targetRows$Sub_metering_1, xlab="", ylab="Energy sub metering", type="n" )
	lines( dateTimeData, targetRows$Sub_metering_1, col="black", xlab="", ylab="Energy sub metering", type="l" )
	lines( dateTimeData, targetRows$Sub_metering_2, col="red", xlab="", ylab="Energy sub metering", type="l" )
	lines( dateTimeData, targetRows$Sub_metering_3, col="blue", xlab="", ylab="Energy sub metering", type="l" )
	legend( "topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = c(1, 1, 1) )
	dev.off()
}