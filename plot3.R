## Make sure you have the data
if(!file.exists("household_power_consumption.zip")){
	fileURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
	download.file(fileURL, destfile="household_power_consumption.zip", method="curl")
}

## Read from 01/02/2007 to 02/02/2007
## First read the header
epc_header <- read.table(unz("household_power_consumption.zip","household_power_consumption.txt"), sep=";", header=TRUE, nrows=1)
epc <- read.table(unz("household_power_consumption.zip","household_power_consumption.txt"), sep=";", header=FALSE, col.names=colnames(epc_header), na.string="?", skip=66637, nrows=2880, colClasses=c("character", "character", rep("numeric", 7)))

## Open device
png(filename="plot3.png", width=480, height=480)

datetime <- strptime(paste(epc$Date, epc$Time), "%d/%m/%Y %H:%M:%S")

plot(datetime, epc$Sub_metering_1 , type="l", main="", ylab="Energy sub metering", xlab="")
points(datetime, epc$Sub_metering_2, type="l", col="red")
points(datetime, epc$Sub_metering_3, type="l", col="blue")
legend("topright", colnames(epc)[7:9], col=c("black", "red", "blue"), lty=1)

dev.off()

# remove objects
rm("epc", "epc_header", "datetime")
