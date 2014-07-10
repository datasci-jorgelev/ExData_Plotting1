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
png(filename="plot2.png", width=480, height=480)

plot(strptime(paste(epc$Date, epc$Time), "%d/%m/%Y %H:%M:%S"), epc$Global_active_power , type="l", main="", ylab="Global Active Power (kilowatts)", xlab="")

## close device
dev.off()

## remove objects
rm("epc", "epc_header")
