library(dplyr)

data <- read.csv("household_power_consumption.txt", sep=";", na.strings="?", skip=66636, nrow=2880, stringsAsFactors=FALSE,
                 col.names = colnames(read.table("household_power_consumption.txt", nrow = 1, sep=";", header = TRUE)))
data <- mutate(data, datetime = as.POSIXct(paste(Date, Time), format="%d/%m/%Y %H:%M:%S"))

png(file = "plot4.png", bg = "transparent")
par(mfcol = c(2, 2))

with(data, plot(datetime, Global_active_power, type="l", xlab="", ylab="Global Active Power"))

with(data, plot(datetime, Sub_metering_1, type="l", xlab="", ylab="Energy sub metering"))
with(data, lines(datetime, Sub_metering_2, col="red"))
with(data, lines(datetime, Sub_metering_3, col="blue"))
legend("topright", lty=1, col=c("black", "red", "blue"), bty="n", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

with(data, plot(datetime, Voltage, type="l"))

with(data, plot(datetime, Global_reactive_power, type="l"))

dev.off()
