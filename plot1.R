## Make sure you have the data
if(!file.exists("household_power_consumption.zip")){
	fileURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
	download.file(fileURL, destfile="household_power_consumption.zip", method="curl")
}

## Read from 01/02/2007 to 02/02/2007
## First read the header
epc_header <- read.table(unz("household_power_consumption.zip","household_power_consumption.txt"), sep=";", header=TRUE, nrows=1)
epc <- read.table(unz("household_power_consumption.zip","household_power_consumption.txt"), sep=";", header=FALSE, col.names=colnames(epc_header), na.string="?", skip=66637, nrows=2880)

## Open device
png(filename="plot1.png", width=480, height=480)

hist(epc$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", col="red")

## close device
dev.off()

## remove objects
rm("epc", "epc_header")
