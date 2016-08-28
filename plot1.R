# This R file plot histogram of "Global_active_power"
# from dataset "household_power_consumption.txt"

plot1 <- function(){
	# Read in data, convert date as.Date
	setClass("myDate")
	setAs("character","myDate", function(from) as.Date(from, format="%d/%m/%Y") )
	powerRaw = read.table("household_power_consumption.txt", header=TRUE, sep = ";", quote="", na.strings = "?", colClasses = c('myDate', 'character', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric'))

	# Get data within startDate and endDate
	startDate <- as.Date("2007-02-01", format="%Y-%m-%d")
	endDate   <- as.Date("2007-02-02", format="%Y-%m-%d")
	targetRows = powerRaw[powerRaw$Date >= startDate & powerRaw$Date <= endDate,]

	# Start plotting in png
	png( file = "plot1.png", width=480, height=480 )
	hist( targetRows$Global_active_power, main="Global Active Power", col = "red", xlab="Global Active Power (kilowatts)" )
	dev.off()
}