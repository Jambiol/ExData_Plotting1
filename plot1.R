data <- read.table('/home/jordi/data/household_power_consumption.txt', sep =';', 
                   header = T, na.strings = "?")

datasubset <- data[data$Date %in% c("1/2/2007","2/2/2007"),]

png("plot1.png", width = 480, height = 480)
hist(datasubset$Global_active_power, col = 'red', main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)")
dev.off()