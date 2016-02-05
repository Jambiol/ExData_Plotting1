data <- read.table('/home/jordi/data/household_power_consumption.txt', sep =';', 
                   header = T, na.strings = "?")

datasubset <- data[data$Date %in% c("1/2/2007","2/2/2007"),]
datasubset$datetime <- strptime(paste(datasubset$Date, datasubset$Time, sep=" "), 
                                "%d/%m/%Y %H:%M:%S") 

png("plot2.png", width=480, height=480)
plot(datasubset$datetime, datasubset$Global_active_power, type="l", xlab="", 
     ylab="Global Active Power (kilowatts)")
dev.off()