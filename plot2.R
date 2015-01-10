## Get full dataset 
plotdata <- read.csv("./Data/household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                      nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
plotdata$Date <- as.Date(plotdata$Date, format="%d/%m/%Y")

## Subset data
data <- subset(plotdata, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(plotdata)

## Convert dates
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)

## Plot 2
plot(data$Global_active_power~data$Datetime, type="l",
     ylab="Global Active Power (kilowatts)", xlab="")
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()