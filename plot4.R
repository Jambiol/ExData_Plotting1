data <- read.table('/home/jordi/data/household_power_consumption.txt', sep =';', 
                   header = T, na.strings = "?")

datasubset <- data[data$Date %in% c("1/2/2007","2/2/2007"),]
datasubset$datetime <- strptime(paste(datasubset$Date, datasubset$Time, sep=" "), 
                                "%d/%m/%Y %H:%M:%S") 

png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 
plot(datasubset$datetime, datasubset$Global_active_power, type="l", xlab="", ylab="Global Active Power")

plot(datasubset$datetime, datasubset$Voltage, type="l", xlab="datetime", ylab="Voltage")

plot(datasubset$datetime, datasubset$Sub_metering_1, type="l", ylab="Energy sub metering", xlab="")
lines(datasubset$datetime, datasubset$Sub_metering_2, type="l", col="red")
lines(datasubset$datetime, datasubset$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd=1, col=c("black", "red", "blue"), bty = 'n')

plot(datasubset$datetime, datasubset$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off() 