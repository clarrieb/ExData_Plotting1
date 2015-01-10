## Get full dataset 
plotdata <- read.csv("./Data/household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                      nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
poltdata_full$Date <- as.Date(plotdata$Date, format="%d/%m/%Y")
/Users/cbaxter/Library/Mobile Documents/com~apple~TextEdit/Documents/Untitled.txt
## Subset data
data <- subset(plotdata, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(plotdata)

## Convert dates
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)

## Plot #1
hist(data$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

## Save plot
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()