library(dplyr)

data <- read.csv("household_power_consumption.txt", sep=";", na.strings="?", skip=66636, nrow=2880, stringsAsFactors=FALSE,
                 col.names = colnames(read.table("household_power_consumption.txt", nrow = 1, sep=";", header = TRUE)))
data <- mutate(data, datetime = as.POSIXct(paste(Date, Time), format="%d/%m/%Y %H:%M:%S"))

png(file = "plot2.png", bg = "transparent")
with(data, plot(datetime, Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)"))
dev.off()
