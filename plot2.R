# This R file plot line of "Global_active_power"
# from dataset "household_power_consumption.txt"

plot2 <- function(){
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
	png( file = "plot2.png", width=480, height=480 )
	plot( dateTimeData, targetRows$Global_active_power, xlab="", ylab="Global Active Power (kilowatts)", type="l" )
	dev.off()
}