library(dplyr)

data <- read.csv("household_power_consumption.txt", sep=";", na.strings="?", skip=66636, nrow=2880, stringsAsFactors=FALSE,
                 col.names = colnames(read.table("household_power_consumption.txt", nrow = 1, sep=";", header = TRUE)))
data <- mutate(data, Date = as.Date(Date, "%d/%m/%Y"), Time = as.POSIXct(Time, format="%H:%M:%S"))

png(file = "plot1.png", bg = "transparent")
hist(data$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()